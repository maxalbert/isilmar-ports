[CVE-2012-0804] Fix proxy response parser

If proxy sends overlong HTTP vesion string, the string will be copied
to unallocatd space (write_buf) causing heap overflow.

This patch fixes it by ignoring the HTTP version string and checking
the response line has been parsed correctly.

See <https://bugzilla.redhat.com/show_bug.cgi?id=773699> for more
details.

Index: src/client.c
===================================================================
RCS file: /sources/cvs/ccvs/src/client.c,v
retrieving revision 1.483
diff -u -r1.483 client.c
--- src/client.c	18 Nov 2008 22:59:02 -0000	1.483
+++ src/client.c	26 Jan 2012 16:32:25 -0000
@@ -4339,9 +4339,9 @@
          * code.
          */
 	read_line_via (from_server, to_server, &read_buf);
-	sscanf (read_buf, "%s %d", write_buf, &codenum);
+	count = sscanf (read_buf, "%*s %d", &codenum);
 
-	if ((codenum / 100) != 2)
+	if (count != 1 || (codenum / 100) != 2)
 	    error (1, 0, "proxy server %s:%d does not support http tunnelling",
 		   root->proxy_hostname, proxy_port_number);
 	free (read_buf);
