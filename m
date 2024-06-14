Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE12EC27C6E
	for <webhook@archiver.kernel.org>; Fri, 14 Jun 2024 10:20:28 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.8398.1718360419551931319
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 14 Jun 2024 03:20:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=xejWNwUd;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: a-limaye@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45EAKHRV038388;
	Fri, 14 Jun 2024 05:20:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718360417;
	bh=Fq2A8eVF1weKab4EUFkwZzBDyDHsg/idH7mCJrxBS4A=;
	h=Date:Subject:To:References:From:CC:In-Reply-To;
	b=xejWNwUd5agFLw1TayRzt253YkgnsLIwiA7hYuzaWq2XSzgOk852+1I+NMXFzY4Ik
	 9VHLHhdOapERflhFt1P3BhEyezvxbPnMm5CV0gFaJLGB9On9Mai3ywQ5w/fd+/EFNZ
	 m1ysyr1+H9DFo9wY5ETL++KQhembbY6N2yNlqeF0=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45EAKHbA075869
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 14 Jun 2024 05:20:17 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 14
 Jun 2024 05:20:17 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 14 Jun 2024 05:20:17 -0500
Received: from [172.24.27.209] (lt5cd112gt3k.dhcp.ti.com [172.24.27.209])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45EAKFCd077781;
	Fri, 14 Jun 2024 05:20:16 -0500
Content-Type: multipart/alternative;
	boundary="------------KvE91An2G1BxlIrJyCE0Wn20"
Message-ID: <f67f2fee-fa34-47b7-bad3-e7b9fa2a0a43@ti.com>
Date: Fri, 14 Jun 2024 15:50:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-ti] [master/scarthgap][PATCH 2/4]
 conf/machine/j721e: some BSPs don't support all SR and HS variants
To: <meta-ti@lists.yoctoproject.org>
References: <20240613172254.770920-1-denis@denix.org>
 <20240613172254.770920-2-denis@denix.org>
Content-Language: en-US
From: "Limaye, Aniket" <a-limaye@ti.com>
CC: "Francis, Neha" <n-francis@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
In-Reply-To: <20240613172254.770920-2-denis@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 14 Jun 2024 10:20:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17731

--------------KvE91An2G1BxlIrJyCE0Wn20
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 45EAKHRV038388

Hi Denys,

On 6/13/2024 10:52 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@=E2=80=8Akonsulko.=E2=80=8Acom> Adjust I=
MAGE_BOOT_FILES=20
> list as some BSPs do not support all combinations of SR1.=E2=80=8A1, SR=
2.=E2=80=8A0,=20
> HS-FS and HS-SE variants. Signed-off-by: Denys Dmytriyenko=20
> <denys@=E2=80=8Akonsulko.=E2=80=8Acom> --- meta-ti-bsp/conf/machine/inc=
lude/j721e.=E2=80=8Ainc
> ZjQcmQRYFpfptBannerStart
> From: Denys Dmytriyenko <denys@konsulko.com>
> Adjust IMAGE_BOOT_FILES list as some BSPs do not support all combinatio=
ns
> of SR1.1, SR2.0, HS-FS and HS-SE variants.
>
> Signed-off-by: Denys Dmytriyenko<denys@konsulko.com>
> ---

Same change is needed for J7200 as well. At the current commit pointed=20
by u-boot-ti-mainline=C2=A0[1], j7200 only has support for below:
GP , SR2.0 HS-FS , SR2.0 HS-SE

Hence also suggest below for j7200.inc:

diff --git a/meta-ti-bsp/conf/machine/include/j7200.inc=20
b/meta-ti-bsp/conf/machine/include/j7200.inc
index caa79876..2a11e3dd 100644
--- a/meta-ti-bsp/conf/machine/include/j7200.inc
+++ b/meta-ti-bsp/conf/machine/include/j7200.inc
@@ -5,10 +5,14 @@ SOC_FAMILY:append =3D ":j7200"
 =C2=A0IMAGE_BOOT_FILES +=3D "tiboot3-j7200-gp-evm.bin"

 =C2=A0# Since default tiboot3.bin on J7200 is for GP, add a version for=20
SR1.0 HS-FS
-IMAGE_BOOT_FILES +=3D "tiboot3-j7200-hs-fs-evm.bin"
+IMAGE_SR1_HS_FS_FILES =3D "tiboot3-j7200-hs-fs-evm.bin"
+IMAGE_SR1_HS_FS_FILES:bsp-mainline =3D ""
+IMAGE_BOOT_FILES +=3D "${IMAGE_SR1_HS_FS_FILES}"

 =C2=A0# Since default tiboot3.bin on J7200 is for GP, add a version for=20
SR1.0 HS-SE
-IMAGE_BOOT_FILES +=3D "tiboot3-j7200-hs-evm.bin"
+IMAGE_SR1_HS_SE_FILES =3D "tiboot3-j7200-hs-evm.bin"
+IMAGE_SR1_HS_SE_FILES:bsp-mainline =3D ""
+IMAGE_BOOT_FILES +=3D "${IMAGE_SR1_HS_SE_FILES}"

 =C2=A0# Since default tiboot3.bin on J7200 is for GP, add a version for=20
SR2.0 HS-FS
 =C2=A0IMAGE_BOOT_FILES +=3D "tiboot3-j7200_sr2-hs-fs-evm.bin"


[1]:=20
https://source.denx.de/u-boot/u-boot/-/blob/866ca972d6c3cabeaf6dbac431e8e=
08bb30b3c8e/arch/arm/dts/k3-j7200-binman.dtsi


>   meta-ti-bsp/conf/machine/include/j721e.inc | 18 ++++++++++--------
>   1 file changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/c=
onf/machine/include/j721e.inc
> index a54c3f2f..62487aa9 100644
> --- a/meta-ti-bsp/conf/machine/include/j721e.inc
> +++ b/meta-ti-bsp/conf/machine/include/j721e.inc
> @@ -13,20 +13,22 @@ IMAGE_BOOT_FILES +=3D "tiboot3-j721e-gp-evm.bin"
>   IMAGE_BOOT_FILES +=3D "sysfw-j721e-gp-evm.itb"
>  =20
>   # Since default on J721e is for GP, add a version for SR1.1 HS-FS
> -IMAGE_BOOT_FILES +=3D "tiboot3-j721e_sr1_1-hs-fs-evm.bin"
> -IMAGE_BOOT_FILES +=3D "sysfw-j721e_sr1_1-hs-fs-evm.itb"
> +IMAGE_SR1_1_HS_FS_FILES =3D "tiboot3-j721e_sr1_1-hs-fs-evm.bin sysfw-j=
721e_sr1_1-hs-fs-evm.itb"
> +IMAGE_SR1_1_HS_FS_FILES:bsp-mainline =3D ""
> +IMAGE_BOOT_FILES +=3D "${IMAGE_SR1_1_HS_FS_FILES}"
>  =20
>   # Since default on J721e is for GP, add a version for SR1.1 HS-SE
> -IMAGE_BOOT_FILES +=3D "tiboot3-j721e_sr1_1-hs-evm.bin"
> -IMAGE_BOOT_FILES +=3D "sysfw-j721e_sr1_1-hs-evm.itb"
> +IMAGE_SR1_1_HS_SE_FILES =3D "tiboot3-j721e_sr1_1-hs-evm.bin sysfw-j721=
e_sr1_1-hs-evm.itb"
> +IMAGE_BOOT_FILES +=3D "${IMAGE_SR1_1_HS_SE_FILES}"
>  =20
>   # Since default on J721e is for GP, add a version for SR2.0 HS-FS
> -IMAGE_BOOT_FILES +=3D "tiboot3-j721e_sr2-hs-fs-evm.bin"
> -IMAGE_BOOT_FILES +=3D "sysfw-j721e_sr2-hs-fs-evm.itb"
> +IMAGE_SR2_HS_FS_FILES =3D "tiboot3-j721e_sr2-hs-fs-evm.bin sysfw-j721e=
_sr2-hs-fs-evm.itb"
> +IMAGE_BOOT_FILES +=3D "${IMAGE_SR2_HS_FS_FILES}"
>  =20
>   # Since default on J721e is for GP, add a version for SR2.0 HS-SE
> -IMAGE_BOOT_FILES +=3D "tiboot3-j721e_sr2-hs-evm.bin"
> -IMAGE_BOOT_FILES +=3D "sysfw-j721e_sr2-hs-evm.itb"
> +IMAGE_SR2_HS_SE_FILES =3D "tiboot3-j721e_sr2-hs-evm.bin sysfw-j721e_sr=
2-hs-evm.itb"
> +IMAGE_SR2_HS_SE_FILES:bsp-mainline =3D ""
> +IMAGE_BOOT_FILES +=3D "${IMAGE_SR2_HS_SE_FILES}"
>  =20
>   TFA_BOARD =3D "generic"
>  =20
> --=20
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17720):https://urldefense.com/v3/__https://lists.yo=
ctoproject.org/g/meta-ti/message/17720__;!!G3vK!ViJQwrQKeC3qqXVZ8kKcUDbfp=
HLQlIvvjLNyHFQgHl3_TFIS3cLW8FGbQrROSxcrLl16vBx3jw$ =20
> Mute This Topic:https://urldefense.com/v3/__https://lists.yoctoproject.=
org/mt/106655976/6607860__;!!G3vK!ViJQwrQKeC3qqXVZ8kKcUDbfpHLQlIvvjLNyHFQ=
gHl3_TFIS3cLW8FGbQrROSxcrLl2K7krThA$ =20
> Group Owner:meta-ti+owner@lists.yoctoproject.org
> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.org/=
g/meta-ti/unsub__;!!G3vK!ViJQwrQKeC3qqXVZ8kKcUDbfpHLQlIvvjLNyHFQgHl3_TFIS=
3cLW8FGbQrROSxcrLl1EHYbH3A$   [a-limaye@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------KvE91An2G1BxlIrJyCE0Wn20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 45EAKHRV038388

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    <p>Hi Denys,</p>
    <div class=3D"moz-cite-prefix">On 6/13/2024 10:52 PM, Denys
      Dmytriyenko wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:20240613172254.770920-2-denis@denix.org">
      <!-- BaNnErBlUrFlE-BoDy-start -->
      <!-- Preheader Text : BEGIN -->
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DU=
TF-8">
      <div
style=3D"display:none !important;display:none;visibility:hidden;mso-hide:=
all;font-size:1px;color:#ffffff;line-height:1px;height:0px;max-height:0px=
;opacity:0;overflow:hidden;">
        From: Denys Dmytriyenko <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:denys@=E2=80=8Akonsulko.=E2=80=8Acom">&lt;denys@=E2=80=8Akonsulko=
.=E2=80=8Acom&gt;</a> Adjust
        IMAGE_BOOT_FILES list as some BSPs do not support all
        combinations of SR1.=E2=80=8A1, SR2.=E2=80=8A0, HS-FS and HS-SE v=
ariants.
        Signed-off-by: Denys Dmytriyenko <a class=3D"moz-txt-link-rfc2396=
E" href=3D"mailto:denys@=E2=80=8Akonsulko.=E2=80=8Acom">&lt;denys@=E2=80=8A=
konsulko.=E2=80=8Acom&gt;</a>
        --- meta-ti-bsp/conf/machine/include/j721e.=E2=80=8Ainc
      </div>
      <!-- Preheader Text : END -->
      <!-- Email Banner : BEGIN -->
      <div
style=3D"display:none !important;display:none;visibility:hidden;mso-hide:=
all;font-size:1px;color:#ffffff;line-height:1px;height:0px;max-height:0px=
;opacity:0;overflow:hidden;">ZjQcmQRYFpfptBannerStart</div>
      <!--[if ((ie)|(mso))]>
  <table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" =
style=3D"padding: 16px 0px 16px 0px; direction: ltr" lang=3D"en"><tr><td>
    <table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D"padd=
ing: 0px 10px 5px 6px; width: 100%; border-radius:4px; border-top:4px sol=
id #90a4ae;background-color:#D0D8DC;"><tr><td valign=3D"top">
      <table align=3D"left" border=3D"0" cellspacing=3D"0" cellpadding=3D=
"0" style=3D"padding: 4px 8px 4px 8px">
	<tr><td style=3D"color:#000000; font-family: 'Arial', sans-serif; font-w=
eight:bold; font-size:14px; direction: ltr">
	  This message was sent from outside of Texas Instruments.
	</td></tr>
	<tr><td style=3D"color:#000000; font-weight:normal; font-family: 'Arial'=
, sans-serif; font-size:12px; direction: ltr">
          Do not click links or open attachments unless you recognize the=
 source of this email and know the content is safe.  If you wish to repor=
t this message to IT Security, please forward the message as an attachmen=
t to phishing@list.ti.com
	</td></tr>

      </table>

    </td></tr></table>
  </td></tr></table>
<![endif]-->
      <!--[if !((ie)|(mso))]--><span style=3D"white-space: pre-wrap">From=
: Denys Dmytriyenko <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:den=
ys@konsulko.com">&lt;denys@konsulko.com&gt;</a></span>
      <pre
style=3D"font-family: sans-serif; font-size: 100%; white-space: pre-wrap;=
 word-wrap: break-word">
Adjust IMAGE_BOOT_FILES list as some BSPs do not support all combinations
of SR1.1, SR2.0, HS-FS and HS-SE variants.

Signed-off-by: Denys Dmytriyenko <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:denys@konsulko.com">&lt;denys@konsulko.com&gt;</a>
---</pre>
    </blockquote>
    <p>Same change is needed for J7200 as well. At the current commit
      pointed by u-boot-ti-mainline=C2=A0[1], j7200 only has support for
      below:<br>
      GP , SR2.0 HS-FS , SR2.0 HS-SE<br>
    </p>
    Hence also suggest below for j7200.inc:
    <p>diff --git a/meta-ti-bsp/conf/machine/include/j7200.inc
      b/meta-ti-bsp/conf/machine/include/j7200.inc<br>
      index caa79876..2a11e3dd 100644<br>
      --- a/meta-ti-bsp/conf/machine/include/j7200.inc<br>
      +++ b/meta-ti-bsp/conf/machine/include/j7200.inc<br>
      @@ -5,10 +5,14 @@ SOC_FAMILY:append =3D ":j7200"<br>
      =C2=A0IMAGE_BOOT_FILES +=3D "tiboot3-j7200-gp-evm.bin"<br>
      <br>
      =C2=A0# Since default tiboot3.bin on J7200 is for GP, add a version=
 for
      SR1.0 HS-FS<br>
      -IMAGE_BOOT_FILES +=3D "tiboot3-j7200-hs-fs-evm.bin"<br>
      +IMAGE_SR1_HS_FS_FILES =3D "tiboot3-j7200-hs-fs-evm.bin"<br>
      +IMAGE_SR1_HS_FS_FILES:bsp-mainline =3D ""<br>
      +IMAGE_BOOT_FILES +=3D "${IMAGE_SR1_HS_FS_FILES}"<br>
      <br>
      =C2=A0# Since default tiboot3.bin on J7200 is for GP, add a version=
 for
      SR1.0 HS-SE<br>
      -IMAGE_BOOT_FILES +=3D "tiboot3-j7200-hs-evm.bin"<br>
      +IMAGE_SR1_HS_SE_FILES =3D "tiboot3-j7200-hs-evm.bin"<br>
      +IMAGE_SR1_HS_SE_FILES:bsp-mainline =3D ""<br>
      +IMAGE_BOOT_FILES +=3D "${IMAGE_SR1_HS_SE_FILES}"<br>
      <br>
      =C2=A0# Since default tiboot3.bin on J7200 is for GP, add a version=
 for
      SR2.0 HS-FS<br>
      =C2=A0IMAGE_BOOT_FILES +=3D "tiboot3-j7200_sr2-hs-fs-evm.bin"<br>
    </p>
    <p><br>
    </p>
    <p>[1]:
<a class=3D"moz-txt-link-freetext" href=3D"https://source.denx.de/u-boot/=
u-boot/-/blob/866ca972d6c3cabeaf6dbac431e8e08bb30b3c8e/arch/arm/dts/k3-j7=
200-binman.dtsi">https://source.denx.de/u-boot/u-boot/-/blob/866ca972d6c3=
cabeaf6dbac431e8e08bb30b3c8e/arch/arm/dts/k3-j7200-binman.dtsi</a></p>
    <p><br>
    </p>
    <p></p>
    <blockquote type=3D"cite"
      cite=3D"mid:20240613172254.770920-2-denis@denix.org">
      <pre
style=3D"font-family: sans-serif; font-size: 100%; white-space: pre-wrap;=
 word-wrap: break-word">
 meta-ti-bsp/conf/machine/include/j721e.inc | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/con=
f/machine/include/j721e.inc
index a54c3f2f..62487aa9 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -13,20 +13,22 @@ IMAGE_BOOT_FILES +=3D "tiboot3-j721e-gp-evm.bin"
 IMAGE_BOOT_FILES +=3D "sysfw-j721e-gp-evm.itb"
=20
 # Since default on J721e is for GP, add a version for SR1.1 HS-FS
-IMAGE_BOOT_FILES +=3D "tiboot3-j721e_sr1_1-hs-fs-evm.bin"
-IMAGE_BOOT_FILES +=3D "sysfw-j721e_sr1_1-hs-fs-evm.itb"
+IMAGE_SR1_1_HS_FS_FILES =3D "tiboot3-j721e_sr1_1-hs-fs-evm.bin sysfw-j72=
1e_sr1_1-hs-fs-evm.itb"
+IMAGE_SR1_1_HS_FS_FILES:bsp-mainline =3D ""
+IMAGE_BOOT_FILES +=3D "${IMAGE_SR1_1_HS_FS_FILES}"
=20
 # Since default on J721e is for GP, add a version for SR1.1 HS-SE
-IMAGE_BOOT_FILES +=3D "tiboot3-j721e_sr1_1-hs-evm.bin"
-IMAGE_BOOT_FILES +=3D "sysfw-j721e_sr1_1-hs-evm.itb"
+IMAGE_SR1_1_HS_SE_FILES =3D "tiboot3-j721e_sr1_1-hs-evm.bin sysfw-j721e_=
sr1_1-hs-evm.itb"
+IMAGE_BOOT_FILES +=3D "${IMAGE_SR1_1_HS_SE_FILES}"
=20
 # Since default on J721e is for GP, add a version for SR2.0 HS-FS
-IMAGE_BOOT_FILES +=3D "tiboot3-j721e_sr2-hs-fs-evm.bin"
-IMAGE_BOOT_FILES +=3D "sysfw-j721e_sr2-hs-fs-evm.itb"
+IMAGE_SR2_HS_FS_FILES =3D "tiboot3-j721e_sr2-hs-fs-evm.bin sysfw-j721e_s=
r2-hs-fs-evm.itb"
+IMAGE_BOOT_FILES +=3D "${IMAGE_SR2_HS_FS_FILES}"
=20
 # Since default on J721e is for GP, add a version for SR2.0 HS-SE
-IMAGE_BOOT_FILES +=3D "tiboot3-j721e_sr2-hs-evm.bin"
-IMAGE_BOOT_FILES +=3D "sysfw-j721e_sr2-hs-evm.itb"
+IMAGE_SR2_HS_SE_FILES =3D "tiboot3-j721e_sr2-hs-evm.bin sysfw-j721e_sr2-=
hs-evm.itb"
+IMAGE_SR2_HS_SE_FILES:bsp-mainline =3D ""
+IMAGE_BOOT_FILES +=3D "${IMAGE_SR2_HS_SE_FILES}"
=20
 TFA_BOARD =3D "generic"
=20
--=20
2.25.1

</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#17720): <a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-ti/messag=
e/17720__;!!G3vK!ViJQwrQKeC3qqXVZ8kKcUDbfpHLQlIvvjLNyHFQgHl3_TFIS3cLW8FGb=
QrROSxcrLl16vBx3jw$">https://urldefense.com/v3/__https://lists.yoctoproje=
ct.org/g/meta-ti/message/17720__;!!G3vK!ViJQwrQKeC3qqXVZ8kKcUDbfpHLQlIvvj=
LNyHFQgHl3_TFIS3cLW8FGbQrROSxcrLl16vBx3jw$</a>=20
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://urlde=
fense.com/v3/__https://lists.yoctoproject.org/mt/106655976/6607860__;!!G3=
vK!ViJQwrQKeC3qqXVZ8kKcUDbfpHLQlIvvjLNyHFQgHl3_TFIS3cLW8FGbQrROSxcrLl2K7k=
rThA$">https://urldefense.com/v3/__https://lists.yoctoproject.org/mt/1066=
55976/6607860__;!!G3vK!ViJQwrQKeC3qqXVZ8kKcUDbfpHLQlIvvjLNyHFQgHl3_TFIS3c=
LW8FGbQrROSxcrLl2K7krThA$</a>=20
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:meta-ti=
+owner@lists.yoctoproject.org">meta-ti+owner@lists.yoctoproject.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://urldefens=
e.com/v3/__https://lists.yoctoproject.org/g/meta-ti/unsub__;!!G3vK!ViJQwr=
QKeC3qqXVZ8kKcUDbfpHLQlIvvjLNyHFQgHl3_TFIS3cLW8FGbQrROSxcrLl1EHYbH3A$">ht=
tps://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-ti/unsub_=
_;!!G3vK!ViJQwrQKeC3qqXVZ8kKcUDbfpHLQlIvvjLNyHFQgHl3_TFIS3cLW8FGbQrROSxcr=
Ll1EHYbH3A$</a>  [<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:a-=
limaye@ti.com">a-limaye@ti.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
  </body>
</html>

--------------KvE91An2G1BxlIrJyCE0Wn20--

