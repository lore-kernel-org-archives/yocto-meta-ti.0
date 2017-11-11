Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B7CF5E00CF1; Fri, 10 Nov 2017 17:45:06 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0B159E00CEC
	for <meta-ti@yoctoproject.org>; Fri, 10 Nov 2017 17:45:04 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C8B1220A40;
	Sat, 11 Nov 2017 01:45:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id hNvQEIDmhhmm; Sat, 11 Nov 2017 01:45:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9F9932031B;
	Sat, 11 Nov 2017 01:45:02 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 137C1162717;
	Fri, 10 Nov 2017 20:45:02 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Fri, 10 Nov 2017 20:45:01 -0500
Message-Id: <1510364701-24798-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] gdbc6x: fix gcc7 implicit fallthrough, format overflow and format truncation errors
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sat, 11 Nov 2017 01:45:06 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...djust-fall-through-comment-to-work-with-g.patch | 35 +++++++++++++++++++
 ...ct-fallthrough-comment-to-recognize-by-gc.patch | 26 ++++++++++++++
 ....c-fix-implicit-fallthrough-error-in-gcc7.patch | 26 ++++++++++++++
 ....c-fix-implicit-fallthrough-error-in-gcc7.patch | 25 ++++++++++++++
 ...-ihex.c-fix-format-overflow-error-in-gcc7.patch | 26 ++++++++++++++
 ...-comments-for-implicit-fallthrough-error-.patch | 38 ++++++++++++++++++++
 ...implicit-fallthrough-and-format-overflow-.patch | 40 ++++++++++++++++++++++
 ...-fix-format-truncation-and-implicit-fallt.patch | 35 +++++++++++++++++++
 recipes-devtools/gdbc6x/gdbc6x_git.bb              | 12 +++++--
 9 files changed, 261 insertions(+), 2 deletions(-)
 create mode 100644 recipes-devtools/gdbc6x/gdbc6x/0001-coffgen.c-adjust-fall-through-comment-to-work-with-g.patch
 create mode 100644 recipes-devtools/gdbc6x/gdbc6x/0001-elf.c-correct-fallthrough-comment-to-recognize-by-gc.patch
 create mode 100644 recipes-devtools/gdbc6x/gdbc6x/0001-elf32-tic6x.c-fix-implicit-fallthrough-error-in-gcc7.patch
 create mode 100644 recipes-devtools/gdbc6x/gdbc6x/0001-elflink.c-fix-implicit-fallthrough-error-in-gcc7.patch
 create mode 100644 recipes-devtools/gdbc6x/gdbc6x/0001-ihex.c-fix-format-overflow-error-in-gcc7.patch
 create mode 100644 recipes-devtools/gdbc6x/gdbc6x/0001-reloc.c-add-comments-for-implicit-fallthrough-error-.patch
 create mode 100644 recipes-devtools/gdbc6x/gdbc6x/0001-srec.c-fix-implicit-fallthrough-and-format-overflow-.patch
 create mode 100644 recipes-devtools/gdbc6x/gdbc6x/0001-tic6x-dis.c-fix-format-truncation-and-implicit-fallt.patch

diff --git a/recipes-devtools/gdbc6x/gdbc6x/0001-coffgen.c-adjust-fall-through-comment-to-work-with-g.patch b/recipes-devtools/gdbc6x/gdbc6x/0001-coffgen.c-adjust-fall-through-comment-to-work-with-g.patch
new file mode 100644
index 0000000..eb72db9
--- /dev/null
+++ b/recipes-devtools/gdbc6x/gdbc6x/0001-coffgen.c-adjust-fall-through-comment-to-work-with-g.patch
@@ -0,0 +1,35 @@
+From 043a40fdc396118e099180b0ce0578ead24cf312 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Fri, 10 Nov 2017 19:12:28 -0500
+Subject: [PATCH] coffgen.c: adjust fall through comment to work with gcc7
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ gdbc6x/bfd/coffgen.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gdbc6x/bfd/coffgen.c b/gdbc6x/bfd/coffgen.c
+index 07a527d..665df95 100644
+--- a/gdbc6x/bfd/coffgen.c
++++ b/gdbc6x/bfd/coffgen.c
+@@ -2116,7 +2116,7 @@ coff_print_symbol (bfd *abfd,
+ 				 auxp->u.auxent.x_scn.x_comdat);
+ 		      break;
+ 		    }
+-		    /* Otherwise fall through.  */
++		    /* Else fall through.  */
+ 		case C_EXT:
+ 		case C_AIX_WEAKEXT:
+ 		  if (ISFCN (combined->u.syment.n_type))
+@@ -2136,7 +2136,7 @@ coff_print_symbol (bfd *abfd,
+ 			       llnos, next);
+ 		      break;
+ 		    }
+-		  /* Otherwise fall through.  */
++		  /* Else fall through.  */
+ 		default:
+ 		  fprintf (file, "AUX lnno %d size 0x%x tagndx %ld",
+ 			   auxp->u.auxent.x_sym.x_misc.x_lnsz.x_lnno,
+-- 
+2.7.4
+
diff --git a/recipes-devtools/gdbc6x/gdbc6x/0001-elf.c-correct-fallthrough-comment-to-recognize-by-gc.patch b/recipes-devtools/gdbc6x/gdbc6x/0001-elf.c-correct-fallthrough-comment-to-recognize-by-gc.patch
new file mode 100644
index 0000000..de5f1ca
--- /dev/null
+++ b/recipes-devtools/gdbc6x/gdbc6x/0001-elf.c-correct-fallthrough-comment-to-recognize-by-gc.patch
@@ -0,0 +1,26 @@
+From b77515953ba72728a10a46381d8b1dd73b89825d Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Fri, 10 Nov 2017 20:19:51 -0500
+Subject: [PATCH] elf.c: correct fallthrough comment to recognize by gcc7
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ gdbc6x/bfd/elf.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gdbc6x/bfd/elf.c b/gdbc6x/bfd/elf.c
+index ede51e9..80bac08 100644
+--- a/gdbc6x/bfd/elf.c
++++ b/gdbc6x/bfd/elf.c
+@@ -1595,7 +1595,7 @@ bfd_section_from_shdr (bfd *abfd, unsigned int shindex)
+ 	      if (hdr->sh_link == (SHN_LORESERVE & 0xffff) /* SHN_BEFORE */
+ 		  || hdr->sh_link == ((SHN_LORESERVE + 1) & 0xffff) /* SHN_AFTER */)
+ 		break;
+-	      /* Otherwise fall through.  */
++	      /* Else fall through.  */
+ 	    default:
+ 	      return FALSE;
+ 	    }
+-- 
+2.7.4
+
diff --git a/recipes-devtools/gdbc6x/gdbc6x/0001-elf32-tic6x.c-fix-implicit-fallthrough-error-in-gcc7.patch b/recipes-devtools/gdbc6x/gdbc6x/0001-elf32-tic6x.c-fix-implicit-fallthrough-error-in-gcc7.patch
new file mode 100644
index 0000000..5591f83
--- /dev/null
+++ b/recipes-devtools/gdbc6x/gdbc6x/0001-elf32-tic6x.c-fix-implicit-fallthrough-error-in-gcc7.patch
@@ -0,0 +1,26 @@
+From fed1d4701b8442c613e7ebc0bb94b251844d3b1c Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Fri, 10 Nov 2017 20:16:20 -0500
+Subject: [PATCH] elf32-tic6x.c: fix implicit fallthrough error in gcc7
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ gdbc6x/bfd/elf32-tic6x.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gdbc6x/bfd/elf32-tic6x.c b/gdbc6x/bfd/elf32-tic6x.c
+index fe82c8f..b046566 100644
+--- a/gdbc6x/bfd/elf32-tic6x.c
++++ b/gdbc6x/bfd/elf32-tic6x.c
+@@ -2365,7 +2365,7 @@ elf32_tic6x_relocate_section (bfd *output_bfd,
+ 		  goto done_reloc;
+ 		}
+ 	    }
+-
++	    /* FALLTHRU */
+ 	case R_C6000_PCR_S12:
+ 	case R_C6000_PCR_S10:
+ 	case R_C6000_PCR_S7:
+-- 
+2.7.4
+
diff --git a/recipes-devtools/gdbc6x/gdbc6x/0001-elflink.c-fix-implicit-fallthrough-error-in-gcc7.patch b/recipes-devtools/gdbc6x/gdbc6x/0001-elflink.c-fix-implicit-fallthrough-error-in-gcc7.patch
new file mode 100644
index 0000000..875d786
--- /dev/null
+++ b/recipes-devtools/gdbc6x/gdbc6x/0001-elflink.c-fix-implicit-fallthrough-error-in-gcc7.patch
@@ -0,0 +1,25 @@
+From 1df6aeea82957cab8094043e458cd1ca0741eaef Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Fri, 10 Nov 2017 20:25:40 -0500
+Subject: [PATCH] elflink.c: fix implicit fallthrough error in gcc7
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ gdbc6x/bfd/elflink.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gdbc6x/bfd/elflink.c b/gdbc6x/bfd/elflink.c
+index 7dcafd6..e173399 100644
+--- a/gdbc6x/bfd/elflink.c
++++ b/gdbc6x/bfd/elflink.c
+@@ -7698,6 +7698,7 @@ eval_symbol (bfd_vma *result,
+ 
+     case 'S':
+       symbol_is_section = TRUE;
++      /* FALLTHRU */
+     case 's':
+       ++sym;
+       symlen = strtol (sym, (char **) symp, 10);
+-- 
+2.7.4
+
diff --git a/recipes-devtools/gdbc6x/gdbc6x/0001-ihex.c-fix-format-overflow-error-in-gcc7.patch b/recipes-devtools/gdbc6x/gdbc6x/0001-ihex.c-fix-format-overflow-error-in-gcc7.patch
new file mode 100644
index 0000000..95b6e44
--- /dev/null
+++ b/recipes-devtools/gdbc6x/gdbc6x/0001-ihex.c-fix-format-overflow-error-in-gcc7.patch
@@ -0,0 +1,26 @@
+From daca80121b92504c4a21e7420765a91d9625f2a4 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Fri, 10 Nov 2017 20:11:45 -0500
+Subject: [PATCH] ihex.c: fix format overflow error in gcc7
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ gdbc6x/bfd/ihex.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gdbc6x/bfd/ihex.c b/gdbc6x/bfd/ihex.c
+index 09f756a..abe7398 100644
+--- a/gdbc6x/bfd/ihex.c
++++ b/gdbc6x/bfd/ihex.c
+@@ -217,7 +217,7 @@ ihex_bad_byte (bfd *abfd, unsigned int lineno, int c, bfd_boolean error)
+     }
+   else
+     {
+-      char buf[10];
++      char buf[13];
+ 
+       if (! ISPRINT (c))
+ 	sprintf (buf, "\\%03o", (unsigned int) c);
+-- 
+2.7.4
+
diff --git a/recipes-devtools/gdbc6x/gdbc6x/0001-reloc.c-add-comments-for-implicit-fallthrough-error-.patch b/recipes-devtools/gdbc6x/gdbc6x/0001-reloc.c-add-comments-for-implicit-fallthrough-error-.patch
new file mode 100644
index 0000000..a21d421
--- /dev/null
+++ b/recipes-devtools/gdbc6x/gdbc6x/0001-reloc.c-add-comments-for-implicit-fallthrough-error-.patch
@@ -0,0 +1,38 @@
+From e4708813cc0d08b75a8db49dcde0722f3d3add5c Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Fri, 10 Nov 2017 19:30:22 -0500
+Subject: [PATCH] reloc.c: add comments for implicit fallthrough error in gcc7
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ gdbc6x/bfd/reloc.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/gdbc6x/bfd/reloc.c b/gdbc6x/bfd/reloc.c
+index 0d191f1..a6e0e12 100644
+--- a/gdbc6x/bfd/reloc.c
++++ b/gdbc6x/bfd/reloc.c
+@@ -7254,15 +7254,20 @@ bfd_default_reloc_type_lookup (bfd *abfd, bfd_reloc_code_real_type code)
+ 	{
+ 	case 64:
+ 	  BFD_FAIL ();
++	  /* FALLTHRU */
+ 	case 32:
+ 	  return &bfd_howto_32;
+ 	case 16:
+ 	  BFD_FAIL ();
++	  /* FALLTHRU */
+ 	default:
+ 	  BFD_FAIL ();
++	  /* FALLTHRU */
+ 	}
++	/* FALLTHRU */
+     default:
+       BFD_FAIL ();
++      /* FALLTHRU */
+     }
+   return NULL;
+ }
+-- 
+2.7.4
+
diff --git a/recipes-devtools/gdbc6x/gdbc6x/0001-srec.c-fix-implicit-fallthrough-and-format-overflow-.patch b/recipes-devtools/gdbc6x/gdbc6x/0001-srec.c-fix-implicit-fallthrough-and-format-overflow-.patch
new file mode 100644
index 0000000..9ecb5a4
--- /dev/null
+++ b/recipes-devtools/gdbc6x/gdbc6x/0001-srec.c-fix-implicit-fallthrough-and-format-overflow-.patch
@@ -0,0 +1,40 @@
+From 36293cf669de453207ce38cd8ac296df4a34e6b5 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Fri, 10 Nov 2017 19:40:41 -0500
+Subject: [PATCH] srec.c: fix implicit fallthrough and format overflow errors
+ in gcc7
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ gdbc6x/bfd/srec.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/gdbc6x/bfd/srec.c b/gdbc6x/bfd/srec.c
+index ded9e76..076e152 100644
+--- a/gdbc6x/bfd/srec.c
++++ b/gdbc6x/bfd/srec.c
+@@ -248,7 +248,7 @@ srec_bad_byte (bfd *abfd,
+     }
+   else
+     {
+-      char buf[10];
++      char buf[13];
+ 
+       if (! ISPRINT (c))
+ 	sprintf (buf, "\\%03o", (unsigned int) c);
+@@ -961,10 +961,12 @@ srec_write_record (bfd *abfd,
+     case 7:
+       TOHEX (dst, (address >> 24), check_sum);
+       dst += 2;
++      /* FALLTHRU */
+     case 8:
+     case 2:
+       TOHEX (dst, (address >> 16), check_sum);
+       dst += 2;
++      /* FALLTHRU */
+     case 9:
+     case 1:
+     case 0:
+-- 
+2.7.4
+
diff --git a/recipes-devtools/gdbc6x/gdbc6x/0001-tic6x-dis.c-fix-format-truncation-and-implicit-fallt.patch b/recipes-devtools/gdbc6x/gdbc6x/0001-tic6x-dis.c-fix-format-truncation-and-implicit-fallt.patch
new file mode 100644
index 0000000..e7c7d65
--- /dev/null
+++ b/recipes-devtools/gdbc6x/gdbc6x/0001-tic6x-dis.c-fix-format-truncation-and-implicit-fallt.patch
@@ -0,0 +1,35 @@
+From b14e8814c467e8cea03725d2e7c937f352449ab6 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Fri, 10 Nov 2017 20:33:26 -0500
+Subject: [PATCH] tic6x-dis.c: fix format truncation and implicit fallthrough
+ errors in gcc7
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ gdbc6x/opcodes/tic6x-dis.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/gdbc6x/opcodes/tic6x-dis.c b/gdbc6x/opcodes/tic6x-dis.c
+index d926d09..69ba999 100644
+--- a/gdbc6x/opcodes/tic6x-dis.c
++++ b/gdbc6x/opcodes/tic6x-dis.c
+@@ -691,7 +691,7 @@ print_insn_tic6x (bfd_vma addr, struct disassemble_info *info)
+ 	  if (opc->flags & TIC6X_FLAG_INSN16_BSIDE && func_unit_side == 1)
+ 	      func_unit_cross = 1;
+ 
+-	  snprintf (func_unit_buf, 7, " .%c%u%s%s", func_unit_char,
++	  snprintf (func_unit_buf, 8, " .%c%u%s%s", func_unit_char,
+ 		    func_unit_side, (func_unit_cross ? "X" : ""), data_str);
+ 	  func_unit = func_unit_buf;
+ 	}
+@@ -1085,6 +1085,7 @@ print_insn_tic6x (bfd_vma addr, struct disassemble_info *info)
+ 		case tic6x_coding_mem_offset_minus_one_noscale:
+ 		case tic6x_coding_mem_offset_minus_one:
+ 		  fld_val += 1;
++		  /* FALLTHRU */
+ 		case tic6x_coding_mem_offset_noscale:
+ 		case tic6x_coding_mem_offset:
+ 		  mem_offset = fld_val;
+-- 
+2.7.4
+
diff --git a/recipes-devtools/gdbc6x/gdbc6x_git.bb b/recipes-devtools/gdbc6x/gdbc6x_git.bb
index 0e6a907..820e1d0 100644
--- a/recipes-devtools/gdbc6x/gdbc6x_git.bb
+++ b/recipes-devtools/gdbc6x/gdbc6x_git.bb
@@ -5,10 +5,18 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=bf0fe2872eb3dfeebb2cbe38206fe81f
 
 DEPENDS = "ncurses bison texinfo flex gettext"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI_append = " \
     file://init \
+    file://0001-coffgen.c-adjust-fall-through-comment-to-work-with-g.patch;striplevel=2 \
+    file://0001-reloc.c-add-comments-for-implicit-fallthrough-error-.patch;striplevel=2 \
+    file://0001-srec.c-fix-implicit-fallthrough-and-format-overflow-.patch;striplevel=2 \
+    file://0001-ihex.c-fix-format-overflow-error-in-gcc7.patch;striplevel=2 \
+    file://0001-elf32-tic6x.c-fix-implicit-fallthrough-error-in-gcc7.patch;striplevel=2 \
+    file://0001-elf.c-correct-fallthrough-comment-to-recognize-by-gc.patch;striplevel=2 \
+    file://0001-elflink.c-fix-implicit-fallthrough-error-in-gcc7.patch;striplevel=2 \
+    file://0001-tic6x-dis.c-fix-format-truncation-and-implicit-fallt.patch;striplevel=2 \
 "
 
 S = "${WORKDIR}/git/gdbc6x"
@@ -34,7 +42,7 @@ do_install () {
     install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/gdbserverproxy
 }
 
-RDEPENDS_${PN} = "gdbserverproxy-module-drv"
+RDEPENDS_${PN} = "gdbserverproxy-module-drv bash"
 
 include gdbc6x.inc
 
-- 
2.7.4


