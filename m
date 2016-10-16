Return-Path: <gary@mlbassoc.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E083DE00529; Sun, 16 Oct 2016 03:46:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9A1A1E00498
	for <meta-ti@yoctoproject.org>; Sun, 16 Oct 2016 03:46:24 -0700 (PDT)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 69A8168A01C; Sun, 16 Oct 2016 11:46:22 +0100 (BST)
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id CE6B568A019;
	Sun, 16 Oct 2016 11:46:21 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 441726740258;
	Sun, 16 Oct 2016 12:46:21 +0200 (CEST)
To: meta-ti@yoctoproject.org
References: <93e07642-1cc5-40eb-ac40-2debe67d0c72@email.android.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <212371ab-9b66-e313-9cf3-9b9ce3578807@mlbassoc.com>
Date: Sun, 16 Oct 2016 12:46:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <93e07642-1cc5-40eb-ac40-2debe67d0c72@email.android.com>
Subject: Re: Can't build for BeagleBone
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
X-List-Received-Date: Sun, 16 Oct 2016 10:46:28 -0000
X-Groupsio-MsgNum: 9104
Content-Type: multipart/mixed; boundary="------------4541E1ED6881DEC1AB7A9633"

--------------4541E1ED6881DEC1AB7A9633
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-10-11 12:47, Denys Dmytriyenko wrote:
> Yeah, I'm also getting this in master. Works fine in krogoth. Haven't yet looked close at it though...

There seem to be two things wrong here.

*) Yocto has moved most recipes to use a split source/build tree,
    thus ${S} != ${B}
*) There is some issue with generating the UBOOT_LOCALVERSION that
    causes problems.

This patch [sort of] addresses both.  At least it lets me build a
working U-Boot for the BeagleBone from master.  I know it's not
perfect, but I couldn't figure out the why the UBOOT_LOCALVERSION
stuff wasn't working.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

--------------4541E1ED6881DEC1AB7A9633
Content-Type: text/x-patch;
 name="u-boot.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="u-boot.patch"

diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index b0054c9..a854243 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -8,7 +8,7 @@ def get_git_revision(p):
     except OSError:
         return None
 
-UBOOT_LOCALVERSION = "-g${@get_git_revision('${S}').__str__()[:10]}"
+#UBOOT_LOCALVERSION = "-g${@get_git_revision('${S}').__str__()[:10]}"
 
 UBOOT_SUFFIX ?= "img"
 
@@ -36,7 +36,7 @@ SPL_UART_SYMLINK ?= "${SPL_UART_BINARY}-${MACHINE}"
 do_install_append () {
     if [ "x${SPL_UART_BINARY}" != "x" ]
     then
-        install ${S}/spl/${SPL_UART_BINARY} ${D}/boot/${SPL_UART_IMAGE}
+        install ${B}/spl/${SPL_UART_BINARY} ${D}/boot/${SPL_UART_IMAGE}
         ln -sf ${SPL_UART_IMAGE} ${D}/boot/${SPL_UART_BINARY}
     fi
 }
@@ -45,7 +45,7 @@ do_deploy_append () {
     cd ${DEPLOYDIR}
     if [ "x${SPL_UART_BINARY}" != "x" ]
     then
-        install ${S}/spl/${SPL_UART_BINARY} ${DEPLOYDIR}/${SPL_UART_IMAGE}
+        install ${B}/spl/${SPL_UART_BINARY} ${DEPLOYDIR}/${SPL_UART_IMAGE}
         rm -f ${DEPLOYDIR}/${SPL_UART_BINARY} ${DEPLOYDIR}/${SPL_UART_SYMLINK}
         ln -sf ${SPL_UART_IMAGE} ${DEPLOYDIR}/${SPL_UART_BINARY}
         ln -sf ${SPL_UART_IMAGE} ${DEPLOYDIR}/${SPL_UART_SYMLINK}

--------------4541E1ED6881DEC1AB7A9633--
