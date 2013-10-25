Return-Path: <V.Vogelhuber@DigitalEndoscopy.de>
Received: from SRV-MSX01.digitendos.local
	(host-80-81-19-29.customer.m-online.net [80.81.19.29])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3FA73E01765
	for <meta-ti@yoctoproject.org>; Fri, 25 Oct 2013 03:12:39 -0700 (PDT)
Received: from [192.168.10.111] (192.168.10.111) by SRV-MSX01.digitendos.local
	(192.168.10.14) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Fri, 25 Oct 2013 12:12:37 +0200
Message-ID: <526A4413.2090801@digitalendoscopy.de>
Date: Fri, 25 Oct 2013 12:12:35 +0200
From: Volker Vogelhuber <v.vogelhuber@digitalendoscopy.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <meta-ti@yoctoproject.org>
X-Originating-IP: [192.168.10.111]
X-TM-AS-Product-Ver: SMEX-10.1.0.2244-7.000.1014-20242.004
X-TM-AS-Result: No--11.189200-0.000000-31
X-TM-AS-User-Approved-Sender: Yes
X-TM-AS-User-Blocked-Sender: No
Subject: State of dylan branch in meta-ti
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
X-List-Received-Date: Fri, 25 Oct 2013 10:12:43 -0000
X-Groupsio-MsgNum: 3593
Content-Type: multipart/mixed; boundary="------------090603090202060301020506"

--------------090603090202060301020506
Content-Type: multipart/alternative;
	boundary="------------040207010405000600090205"

--------------040207010405000600090205
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit

I just checked out the dylan branch of the yocto core and the meta-ti 
repository.
It seems like the state of the meta-ti branch is not yet consistent to 
work out of the box.

I currently had to remove the update-modules part from the ti recipes 
and had to add
RPROVIDES_${PN} += "kernel-module-dsplinkk" to the ti-dsplink.inc

Did I miss something or the dylan branch just not yet in a consistent state?

Regards,
    Volker

-- 

*Volker Vogelhuber*| Softwareentwickler

*PENTAX**MEDICA**L
*/Excellence in Focus//^TM /

Tel: +49(0)821-650566-18
v.vogelhuber@DigitalEndoscopy.de <mailto:v.vogelhuber@DigitalEndoscopy.de>

Hoya Corporation - Pentax Medical Division
*Digital**Endoscopy GmbH*
Paul-Lenz-Str. 5
86316 Friedberg - Germany
pentaxmedical.com
Handelsregister HRB 27226
Amtsgericht Augsburg
Geschäftsführer: Michael Drexel, Marc Henzler
Sitz: Paul-Lenz-Str. 5, 86316 Friedberg, Germany

_____________________________________

Diese E-Mail enthält vertrauliche und/oder rechtlich geschützte 
Informationen. Wenn Sie nicht der richtige Adressat sind oder diese 
E-Mail irrtümlich erhalten haben, informieren Sie bitte sofort den 
Absender und vernichten Sie diese Mail. Das unerlaubte Kopieren sowie 
die unbefugte Weitergabe dieser Mail ist nicht gestattet.
This e-mail may contain confidential and/or privileged information. If 
you are not the intended recipient (or have received this e-mail in 
error) please notify the sender immediately and destroy this e-mail. Any 
unauthorized copying, disclosure or distribution of the material in this 
e-mail is strictly forbidden.


--------------040207010405000600090205
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    I just checked out the dylan branch of the yocto core and the
    meta-ti repository.<br>
    It seems like the state of the meta-ti branch is not yet consistent
    to work out of the box.<br>
    <br>
    I currently had to remove the update-modules part from the ti
    recipes and had to add<br>
    RPROVIDES_${PN} += "kernel-module-dsplinkk" to the ti-dsplink.inc<br>
    <br>
    Did I miss something or the dylan branch just not yet in a
    consistent state?<br>
    <br>
    Regards, <br>
    &nbsp;&nbsp; Volker<br>
    <br>
    <div class="moz-signature">-- <br>
      <!-- <head> -->
      <!--   <meta content="text/html; " http-equiv="content-type"> -->
      <!--   <title></title> -->
      <!-- </head> -->
      <p class="MsoNormal"><b><span
style="font-size:10.0pt;font-family:'Arial','sans-serif';color:#404040;mso-fareast-language:DE"
            lang="DE">Volker Vogelhuber</span></b><span
style="font-size:10.0pt;font-family:'Arial','sans-serif';color:#404040;mso-fareast-language:DE"
          lang="DE"> | Softwareentwickler</span></p>
      <p class="MsoNormal"><b><span
            style="font-size:12.0pt;font-family:'serif';color:#DA291C"
            lang="DE">PENTAX</span></b><b><span
            style="font-size:12.0pt;font-family:'serif';color:#53565A"
            lang="DE"> MEDICA</span></b><b><span
            style="font-family:'serif';color:#53565A;font-size:12.0pt;">L<br>
          </span></b><i><span
            style="font-size:12.0pt;font-family:'serif';color:#53565A">Excellence

            in Focus</span></i><i><sup><span
              style="font-size:8.0pt;font-family:'serif';color:#53565A">TM</span></sup></i><span
style="font-size:7.0pt;font-family:'Arial','sans-serif';color:#1F497D;mso-fareast-language:DE"
          lang="EN-GB"><o:p></o:p></span></p>
      <p class="MsoNormal"><span
style="font-size:9.0pt;font-family:'Arial','sans-serif';color:red;mso-fareast-language:DE"
          lang="EN-GB">Tel:&nbsp; </span><span
style="font-size:9.0pt;font-family:'Arial','sans-serif';color:#404040;mso-fareast-language:DE"
          lang="EN-GB">+49(0)821-650566-</span><span
style="font-size:9.0pt;font-family:'Arial','sans-serif';color:#1F497D;mso-fareast-language:DE"
          lang="EN-GB">18</span><span
style="font-size:12.0pt;font-family:'serif';color:#404040;mso-fareast-language:DE"
          lang="EN-GB"><o:p></o:p></span><br>
        <span
style="font-size:9.0pt;font-family:'Arial','sans-serif';color:#404040;mso-fareast-language:DE"
          lang="EN-GB"><a href="mailto:v.vogelhuber@DigitalEndoscopy.de"><span
              style="color:#404040;text-decoration:none" lang="EN-US">v.vogelhuber@DigitalEndoscopy.de</span></a><o:p></o:p></span></p>
      <p class="MsoNormal"><span
style="font-size:10.0pt;font-family:'Arial','sans-serif';color:#404040;mso-fareast-language:DE"
          lang="EN-GB">Hoya Corporation - Pentax Medical Division</span><br>
        <b><span
style="font-size:10.0pt;font-family:'Arial','sans-serif';color:#404040;mso-fareast-language:DE"
            lang="EN-GB">Digital</span></b><b><span
style="font-size:10.0pt;font-family:'Arial','sans-serif';color:#404040;mso-fareast-language:DE"
            lang="EN-GB"> Endoscopy GmbH<o:p></o:p></span></b><span
style="font-size:9.0pt;font-family:'Arial','sans-serif';color:#404040;mso-fareast-language:DE"
          lang="EN-GB"><br>
          Paul-Lenz-Str. 5<o:p></o:p><br>
          86316 Friedberg - Germany<o:p></o:p></span><span
          style="font-family:'serif';color:#E70600;mso-fareast-language:JA"><br>
          pentax</span><span
          style="font-family:'serif';color:#0D2531;mso-fareast-language:JA">medical.com</span><span
style="font-size:5.0pt;font-family:'Arial','sans-serif';color:#1F497D;mso-fareast-language:DE"><o:p></o:p></span><span
style="font-size:8.0pt;font-family:'Arial','sans-serif';color:#404040;mso-fareast-language:DE"
          lang="DE"><br>
          Handelsregister HRB 27226<o:p></o:p><br>
          Amtsgericht Augsburg<o:p></o:p><br>
          Gesch&auml;ftsf&uuml;hrer: Michael Drexel, Marc Henzler<o:p></o:p><br>
          Sitz: Paul-Lenz-Str. 5, 86316 Friedberg, Germany</span><span
style="font-size:8.0pt;font-family:'Arial','sans-serif';color:#1F497D;mso-fareast-language:DE"
          lang="DE"><o:p></o:p></span> </p>
      <p class="MsoNormal"><span
style="font-size:8.0pt;font-family:'Arial','sans-serif';color:#404040;mso-fareast-language:DE"
          lang="DE"><o:p>&nbsp;</o:p></span><span
style="font-size:10.0pt;font-family:'Arial','sans-serif';color:#404040;mso-fareast-language:DE"
          lang="DE">_____________________________________<o:p></o:p></span><span
style="font-size:8.0pt;font-family:'Arial','sans-serif';color:#404040;mso-fareast-language:DE"
          lang="DE"><o:p>&nbsp;</o:p></span> </p>
      <p class="MsoNormal"><span
style="font-size:8.0pt;font-family:'Arial','sans-serif';color:#404040;mso-fareast-language:DE"
          lang="EN-GB">Diese E-Mail enth&auml;lt vertrauliche und/oder
          rechtlich gesch&uuml;tzte Informationen. Wenn Sie nicht der
          richtige Adressat sind oder diese E-Mail irrt&uuml;mlich erhalten
          haben, informieren Sie bitte sofort den Absender und
          vernichten Sie diese Mail. Das unerlaubte Kopieren sowie die
          unbefugte Weitergabe dieser Mail ist nicht gestattet.<br>
          This e-mail may contain confidential and/or privileged
          information. If you are not the intended recipient (or have
          received this e-mail in error) please notify the sender
          immediately and destroy this e-mail. Any unauthorized copying,
          disclosure or distribution of the material in this e-mail is
          strictly forbidden.</span><span
          style="color:#404040;mso-fareast-language:DE" lang="EN-GB"><o:p></o:p></span></p>
      <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
    </div>
  </body>
</html>

--------------040207010405000600090205--

--------------090603090202060301020506
Content-Type: text/x-patch; name="update-modules.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="update-modules.patch"

Author: Volker Vogelhuber <v.vogelhuber@digitalendoscopy.de>  2013-10-23 15:29:37
Committer: Volker Vogelhuber <v.vogelhuber@digitalendoscopy.de>  2013-10-23 15:29:37
Parent: f61008a20340373247ebfd8f381e377b21f11afe (linux-ti-staging: update to 3.12-rc5 and latest merges of feature trees)
Child:  2d25a3c6b181894c57d71c3a132a39ef9ed89374 (Merge)
Branch: dylan
Follows: v2012.05-yocto1.2
Precedes: 

    - remove update-modules as it has been removed from yocto

---------------------- recipes-ti/dsplink/ti-dsplink.inc ----------------------
index ce7cbf9..fa1c9dd 100644
@@ -187,22 +187,6 @@ do_install () {
 
 PACKAGES =+ "ti-dsplink-module"
 FILES_ti-dsplink-module = "/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp/dsplinkk.ko" 
-RDEPENDS_ti-dsplink-module += "update-modules"
-
-pkg_postinst_ti-dsplink-module () {
-#!/bin/sh
-if [ -n "$D" ]; then
-	exit 1
-fi
-
-depmod -a
-update-modules || true
-}
-
-pkg_postrm_ti-dsplink-module () {
-#!/bin/sh
-update-modules || true
-}
 
 PACKAGES += "ti-dsplink-examples"
 RDEPENDS_ti-dsplink-examples_append = " ti-dsplink-module"

---------- recipes-ti/local-power-manager/ti-local-power-manager.inc ----------
index 9155c76..2f2b525 100644
@@ -113,19 +113,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 PACKAGES += "ti-lpm-module"
 FILES_ti-lpm-module = "/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp/*lpm*ko"
 RDEPENDS_ti-lpm-module += "ti-dsplink-module"
-RDEPENDS_ti-lpm-module += "update-modules"
-
-pkg_postinst_ti-lpm-module_append () {
-        if [ -n "$D" ]; then
-                exit 1
-        fi
-        depmod -a
-        update-modules || true
-}
-
-pkg_postrm_ti-lpm-module_append () {
-        update-modules || true
-}
 
 PACKAGES += "ti-lpm-utils"
 RDEPENDS_ti-lpm-utils += "ti-lpm-module"


--------------090603090202060301020506--
