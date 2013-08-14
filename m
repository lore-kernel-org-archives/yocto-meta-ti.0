Return-Path: <Valentin.Cobelea@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id BF1BEE006E9
	for <meta-ti@yoctoproject.org>; Wed, 14 Aug 2013 07:15:47 -0700 (PDT)
Received: from localhost.enea.se (192.168.14.201) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1;
	Wed, 14 Aug 2013 16:15:42 +0200
Message-ID: <520B910E.703@enea.com>
Date: Wed, 14 Aug 2013 17:15:42 +0300
From: Vali Cobelea <valentin.cobelea@enea.com>
Organization: ENEA
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: <meta-ti@yoctoproject.org>
X-Originating-IP: [192.168.14.201]
Subject: Warnings shown when running bitbake for pandaboard
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
X-List-Received-Date: Wed, 14 Aug 2013 14:15:50 -0000
X-Groupsio-MsgNum: 3147
Content-Type: multipart/mixed; boundary="------------080504080604090803010708"

--------------080504080604090803010708
Content-Type: multipart/alternative;
	boundary="------------080906040802090200090006"

--------------080906040802090200090006
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

While running bitbake for 'pandaboard' we've got few warnings, as shown 
below, regarding the variable keys. These warnings are produced right 
after the bitbake is started.

Pseudo is not present but is required, building this first before the 
main build
*WARNING: Variable key FILES_${PN}-dev (${includedir} ${FILES_SOLIBSDEV} 
${libdir}/*.la ${libdir}/*.o ${libdir}/pkgconfig ${datadir}/pkgconfig 
${datadir}/aclocal ${base_libdir}/*.o ${libdir}/${BPN}/*.la 
${base_libdir}/*.la) replaces original key FILES_ti-ipc-dev (${libdir}/*).**
**WARNING: Variable key FILES_${PN}-dev (${includedir} 
${FILES_SOLIBSDEV} ${libdir}/*.la ${libdir}/*.o ${libdir}/pkgconfig 
${datadir}/pkgconfig ${datadir}/aclocal ${base_libdir}/*.o 
${libdir}/${BPN}/*.la ${base_libdir}/*.la) replaces original key 
FILES_ti-syslink-dev (${libdir}/*).*
Parsing recipes: 100% 
|##########################################################################################################| 
Time: 00:00:05
Parsing of 916 .bb files complete (0 cached, 916 parsed). 1227 targets, 
149 skipped, 3 masked, 0 errors.
...


In order to fix this issue we've made the attached fix; which solved on 
our side the above problem with the warnings.
Now the question is if the patch is ready for upstream, and second, what 
would be the procedure to have this patch (if all good with it) merged 
into the 'meta-ti'.

Thank you very much,
Vali


--------------080906040802090200090006
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Hello,<br>
    <br>
    While running bitbake for 'pandaboard' we've got few warnings, as
    shown below, regarding the variable keys. These warnings are
    produced right after the bitbake is started.<br>
    <br style="color: rgb(51, 51, 51); font-family: Arial, sans-serif;
      font-size: 14px; font-style: normal; font-variant: normal;
      font-weight: normal; letter-spacing: normal; line-height: 20px;
      orphans: auto; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);">
    <span style="color: rgb(51, 51, 51); font-family: Arial, sans-serif;
      font-size: 14px; font-style: normal; font-variant: normal;
      font-weight: normal; letter-spacing: normal; line-height: 20px;
      orphans: auto; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255); display: inline !important;
      float: none;">Pseudo is not present but is required, building this
      first before the main build<span class="Apple-converted-space">&nbsp;</span></span><br
      style="color: rgb(51, 51, 51); font-family: Arial, sans-serif;
      font-size: 14px; font-style: normal; font-variant: normal;
      font-weight: normal; letter-spacing: normal; line-height: 20px;
      orphans: auto; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);">
    <b><span style="color: rgb(51, 51, 51); font-family: Arial,
        sans-serif; font-size: 14px; font-style: normal; font-variant:
        normal; font-weight: normal; letter-spacing: normal;
        line-height: 20px; orphans: auto; text-align: start;
        text-indent: 0px; text-transform: none; white-space: normal;
        widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;
        background-color: rgb(255, 255, 255); display: inline
        !important; float: none;">WARNING: Variable key FILES_${PN}-dev
        (${includedir} ${FILES_SOLIBSDEV} ${libdir}/*.la ${libdir}/*.o
        ${libdir}/pkgconfig ${datadir}/pkgconfig ${datadir}/aclocal
        ${base_libdir}/*.o ${libdir}/${BPN}/*.la ${base_libdir}/*.la)
        replaces original key FILES_ti-ipc-dev (${libdir}/*).<span
          class="Apple-converted-space">&nbsp;</span></span></b><b><br
        style="color: rgb(51, 51, 51); font-family: Arial, sans-serif;
        font-size: 14px; font-style: normal; font-variant: normal;
        font-weight: normal; letter-spacing: normal; line-height: 20px;
        orphans: auto; text-align: start; text-indent: 0px;
        text-transform: none; white-space: normal; widows: auto;
        word-spacing: 0px; -webkit-text-stroke-width: 0px;
        background-color: rgb(255, 255, 255);">
    </b><b><span style="color: rgb(51, 51, 51); font-family: Arial,
        sans-serif; font-size: 14px; font-style: normal; font-variant:
        normal; font-weight: normal; letter-spacing: normal;
        line-height: 20px; orphans: auto; text-align: start;
        text-indent: 0px; text-transform: none; white-space: normal;
        widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;
        background-color: rgb(255, 255, 255); display: inline
        !important; float: none;">WARNING: Variable key FILES_${PN}-dev
        (${includedir} ${FILES_SOLIBSDEV} ${libdir}/*.la ${libdir}/*.o
        ${libdir}/pkgconfig ${datadir}/pkgconfig ${datadir}/aclocal
        ${base_libdir}/*.o ${libdir}/${BPN}/*.la ${base_libdir}/*.la)
        replaces original key FILES_ti-syslink-dev (${libdir}/*).<span
          class="Apple-converted-space">&nbsp;</span></span></b><br
      style="color: rgb(51, 51, 51); font-family: Arial, sans-serif;
      font-size: 14px; font-style: normal; font-variant: normal;
      font-weight: normal; letter-spacing: normal; line-height: 20px;
      orphans: auto; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);">
    <span style="color: rgb(51, 51, 51); font-family: Arial, sans-serif;
      font-size: 14px; font-style: normal; font-variant: normal;
      font-weight: normal; letter-spacing: normal; line-height: 20px;
      orphans: auto; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255); display: inline !important;
      float: none;">Parsing recipes: 100%
      |##########################################################################################################|
      Time: 00:00:05<span class="Apple-converted-space">&nbsp;</span></span><br
      style="color: rgb(51, 51, 51); font-family: Arial, sans-serif;
      font-size: 14px; font-style: normal; font-variant: normal;
      font-weight: normal; letter-spacing: normal; line-height: 20px;
      orphans: auto; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);">
    <span style="color: rgb(51, 51, 51); font-family: Arial, sans-serif;
      font-size: 14px; font-style: normal; font-variant: normal;
      font-weight: normal; letter-spacing: normal; line-height: 20px;
      orphans: auto; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255); display: inline !important;
      float: none;">Parsing of 916 .bb files complete (0 cached, 916
      parsed). 1227 targets, 149 skipped, 3 masked, 0 errors.<span
        class="Apple-converted-space"> </span></span><br>
    ...<br>
    <br>
    <br>
    In order to fix this issue we've made the attached fix; which solved
    on our side the above problem with the warnings.<br>
    Now the question is if the patch is ready for upstream, and second,
    what would be the procedure to have this patch (if all good with it)
    merged into the 'meta-ti'.<br>
    <br>
    Thank you very much,<br>
    Vali<br>
    <br>
  </body>
</html>

--------------080906040802090200090006--

--------------080504080604090803010708
Content-Type: text/x-patch;
	name="0001-LXCR-2019-first-bitbake-on-pandaboard-exhibits-warni.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename*0="0001-LXCR-2019-first-bitbake-on-pandaboard-exhibits-warni.pa";
	filename*1="tch"

From cd1bc888aaeea734b48fe3ccd5e4e0271f8f1480 Mon Sep 17 00:00:00 2001
From: Valentin Cobelea <valentin.cobelea@enea.com>
Date: Mon, 12 Aug 2013 15:53:39 +0200
Subject: [PATCH] LXCR-2019: first bitbake on pandaboard exhibits warning
 during parsing recipes

This patch changes the variable name in order to avoid the display of warnings
 at the begining of a build (when running 'bitbake').

Signed-off-by: Valentin Cobelea <valentin.cobelea@enea.com>
---
 recipes-ti/ipc/ti-ipc.inc         |    2 +-
 recipes-ti/syslink/ti-syslink.inc |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
index 8d1b802..7f4b919 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -33,4 +33,4 @@ do_install() {
     install ${S}/ipc.pc ${D}/${libdir}/pkgconfig/
 }
 
-FILES_ti-ipc-dev = "${libdir}/*"
+FILES_${PN}-dev = "${libdir}/*"
diff --git a/recipes-ti/syslink/ti-syslink.inc b/recipes-ti/syslink/ti-syslink.inc
index 04c59c1..70289d4 100644
--- a/recipes-ti/syslink/ti-syslink.inc
+++ b/recipes-ti/syslink/ti-syslink.inc
@@ -238,4 +238,4 @@ RRECOMMENDS_ti-syslink-examples_append = " ti-syslink-module"
 FILES_ti-syslink-examples = "${installdir}/ti-syslink-examples/*"
 INSANE_SKIP_ti-syslink-examples = "1"
 
-FILES_ti-syslink-dev = "${libdir}/*"
+FILES_${PN}-dev = "${libdir}/*"
-- 
1.7.10.4


--------------080504080604090803010708--
