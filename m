Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78FBAC48BEC
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 07:07:58 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.13767.1708067277044774088
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Feb 2024 23:07:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=ZUKK89rh;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: a-limaye@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41G77uar126239
	for <meta-ti@lists.yoctoproject.org>; Fri, 16 Feb 2024 01:07:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1708067276;
	bh=R9CXhHcm4n2uFs79dob79vUwO9EKuP8mJwo6wFChmJI=;
	h=Date:Subject:To:References:CC:From:In-Reply-To;
	b=ZUKK89rhDYAyeaQXDb2PVu7hM56p0TkE3FT/LF7b9N6qaKAm38rrZLDPDfnsU1oji
	 /MPMXJSIZtKHsBxvrQnjx2sIyd4wCpMI2zzt0w01uYe1AQfuNRONgj+jBjhcAVXMab
	 1+2gsKVShmTCW+WGiUUMaeZ9dfO7ePSgYlyTqTY4=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41G77uqV017980
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 16 Feb 2024 01:07:56 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 16
 Feb 2024 01:07:55 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 16 Feb 2024 01:07:55 -0600
Received: from [172.24.17.33] (lt5cd112gt3k.dhcp.ti.com [172.24.17.33])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41G77sHp105417;
	Fri, 16 Feb 2024 01:07:55 -0600
Content-Type: multipart/alternative;
	boundary="------------wX6o9to5oaiKX32IbjyNxA0Q"
Message-ID: <b8512c7d-2c1a-42b7-a803-e1c4fa76eeba@ti.com>
Date: Fri, 16 Feb 2024 12:37:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-ti][master/kirkstone][PATCH] conf: machine: k3:
 Use Cortex-A53/A72 CPU tune
Content-Language: en-US
To: <meta-ti@lists.yoctoproject.org>
References: <20240215212613.57012-1-afd@ti.com>
CC: "Kumar, Udit" <u-kumar1@ti.com>
From: "Limaye, Aniket" <a-limaye@ti.com>
In-Reply-To: <20240215212613.57012-1-afd@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 16 Feb 2024 07:07:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17483

--------------wX6o9to5oaiKX32IbjyNxA0Q
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 41G77uar126239

Hi Andrew,

I was testing this patch locally, and wanted to see if we get some perf=20
improvements with some benchmarks available on the default image. What=20
benchmark do you recommend testing this against?

I ran '/runLinpack/' on the tisdk-default-image on j7200 and did not see=20
any difference in the reported performance with and without this=20
patch... is this expected?

With the default image built on latest SDK, WITHOUT the patch:
Unrolled Single=C2=A0 Precision 1845878 Kflops ; 10 Reps

With default image built WITH the patch:
Unrolled Single=C2=A0 Precision 1857362 Kflops ; 10 Reps

Thanks,
Aniket

On 2/16/2024 2:56 AM, Andrew Davis via lists.yoctoproject.org wrote:
> All current K3 devices use either A53 or A72. Use the compile tune=20
> configuration specific for these to allow the compiler to make better=20
> optimizations. Signed-off-by: Andrew Davis <afd@=E2=80=8Ati.=E2=80=8Aco=
m> ---=20
> meta-ti-bsp/conf/machine/include/k3.=E2=80=8Ainc
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> ZjQcmQRYFpfptBannerEnd
> All current K3 devices use either A53 or A72. Use the compile tune
> configuration specific for these to allow the compiler to make
> better optimizations.
>
> Signed-off-by: Andrew Davis<afd@ti.com>
> ---
>   meta-ti-bsp/conf/machine/include/k3.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf=
/machine/include/k3.inc
> index 2415f0ba..7c3579af 100644
> --- a/meta-ti-bsp/conf/machine/include/k3.inc
> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
> @@ -3,7 +3,7 @@
>   require conf/machine/include/ti-soc.inc
>   SOC_FAMILY:append =3D ":k3"
>  =20
> -require conf/machine/include/arm/arch-arm64.inc
> +require conf/machine/include/arm/armv8a/tune-cortexa72-cortexa53.inc
>  =20
>   BBMULTICONFIG +=3D "k3r5"
>  =20
> --=20
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17482):https://urldefense.com/v3/__https://lists.yo=
ctoproject.org/g/meta-ti/message/17482__;!!G3vK!T21e4UwMAwqmb2WXp3iTH2w5z=
s9CtoI5wX4pmvJQk3-F9H6FDcANpOSFX7ctu-yvXLL-_io6FQngJ72BANL844OMEXw$ =20
> Mute This Topic:https://urldefense.com/v3/__https://lists.yoctoproject.=
org/mt/104381861/6607860__;!!G3vK!T21e4UwMAwqmb2WXp3iTH2w5zs9CtoI5wX4pmvJ=
Qk3-F9H6FDcANpOSFX7ctu-yvXLL-_io6FQngJ72BANL8UKq3aCI$ =20
> Group Owner:meta-ti+owner@lists.yoctoproject.org
> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.org/=
g/meta-ti/unsub__;!!G3vK!T21e4UwMAwqmb2WXp3iTH2w5zs9CtoI5wX4pmvJQk3-F9H6F=
DcANpOSFX7ctu-yvXLL-_io6FQngJ72BANL8aX0fg_c$   [a-limaye@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------wX6o9to5oaiKX32IbjyNxA0Q
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 41G77uar126239

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>Hi Andrew,<br>
      <br>
      I was testing this patch locally, and wanted to see if we get some
      perf improvements with some benchmarks available on the default
      image. What benchmark do you recommend testing this against?</p>
    <p>I ran '<i>runLinpack</i>' on the tisdk-default-image on j7200 and
      did not see any difference in the reported performance with and
      without this patch... is this expected?<br>
      <br>
      With the default image built on latest SDK, WITHOUT the patch: <br>
      Unrolled Single=C2=A0 Precision 1845878 Kflops ; 10 Reps<br>
      <br>
      With default image built WITH the patch: <br>
      Unrolled Single=C2=A0 Precision 1857362 Kflops ; 10 Reps<br>
    </p>
    <p>Thanks,<br>
      Aniket<br>
    </p>
    <div class=3D"moz-cite-prefix">On 2/16/2024 2:56 AM, Andrew Davis via
      lists.yoctoproject.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20240215212613.57012-1-afd@ti.c=
om">
      <!-- BaNnErBlUrFlE-BoDy-start -->
      <!-- Preheader Text : BEGIN -->
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DU=
TF-8">
      <div
style=3D"display:none !important;display:none;visibility:hidden;mso-hide:=
all;font-size:1px;color:#ffffff;line-height:1px;height:0px;max-height:0px=
;opacity:0;overflow:hidden;">
        All current K3 devices use either A53 or A72. Use the compile
        tune configuration specific for these to allow the compiler to
        make better optimizations. Signed-off-by: Andrew Davis
        <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:afd@=E2=80=8Ati=
.=E2=80=8Acom">&lt;afd@=E2=80=8Ati.=E2=80=8Acom&gt;</a> ---
        meta-ti-bsp/conf/machine/include/k3.=E2=80=8Ainc
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
 source of this email and know the content is safe.
	</td></tr>

      </table>

    </td></tr></table>
  </td></tr></table>
<![endif]-->
      <!--[if !((ie)|(mso))]-->
      <div dir=3D"ltr" id=3D"pfptBannernwvz33m"
style=3D"all: revert !important; display:block !important; text-align: le=
ft !important; margin:16px 0px 16px 0px !important; padding:8px 16px 8px =
16px !important; border-radius: 4px !important; min-width: 200px !importa=
nt; background-color: #D0D8DC !important; background-color: #D0D8DC; bord=
er-top: 4px solid #90a4ae !important; border-top: 4px solid #90a4ae;"
        lang=3D"en">
        <div id=3D"pfptBannernwvz33m"
style=3D"all: unset !important; float:left !important; display:block !imp=
ortant; margin: 0px 0px 1px 0px !important; max-width: 600px !important;"=
>
          <div id=3D"pfptBannernwvz33m"
style=3D"all: unset !important; display:block !important; visibility: vis=
ible !important; background-color: #D0D8DC !important; color:#000000 !imp=
ortant; color:#000000; font-family: 'Arial', sans-serif !important; font-=
family: 'Arial', sans-serif; font-weight:bold !important; font-weight:bol=
d; font-size:14px !important; line-height:18px !important; line-height:18=
px">
            This message was sent from outside of Texas Instruments. </di=
v>
          <div id=3D"pfptBannernwvz33m"
style=3D"all: unset !important; display:block !important; visibility: vis=
ible !important; background-color: #D0D8DC !important; color:#000000 !imp=
ortant; color:#000000; font-weight:normal; font-family: 'Arial', sans-ser=
if !important; font-family: 'Arial', sans-serif; font-size:12px !importan=
t; line-height:18px !important; line-height:18px; margin-top:2px !importa=
nt;">
            Do not click links or open attachments unless you recognize
            the source of this email and know the content is safe. </div>
        </div>
        <div
style=3D"clear: both !important; display: block !important; visibility: h=
idden !important; line-height: 0 !important; font-size: 0.01px !important=
; height: 0px">=C2=A0</div>
      </div>
      <!--[endif]-->
      <div
style=3D"display:none !important;display:none;visibility:hidden;mso-hide:=
all;font-size:1px;color:#ffffff;line-height:1px;height:0px;max-height:0px=
;opacity:0;overflow:hidden;">ZjQcmQRYFpfptBannerEnd</div>
      <!-- Email Banner : END -->
      <!-- BaNnErBlUrFlE-BoDy-end -->
      <!-- BaNnErBlUrFlE-HeAdEr-start -->
      <style>#pfptBannernwvz33m { all: revert !important; display: block =
!important;=20
    visibility: visible !important; opacity: 1 !important;=20
    background-color: #D0D8DC !important;=20
    max-width: none !important; max-height: none !important }.pfptPrimary=
Buttonnwvz33m:hover, .pfptPrimaryButtonnwvz33m:focus {
    background-color: #b4c1c7 !important; }.pfptPrimaryButtonnwvz33m:acti=
ve {
    background-color: #90a4ae !important; }</style>
      <!-- BaNnErBlUrFlE-HeAdEr-end -->
      <pre
style=3D"font-family: sans-serif; font-size: 100%; white-space: pre-wrap;=
 word-wrap: break-word">All current K3 devices use either A53 or A72. Use=
 the compile tune
configuration specific for these to allow the compiler to make
better optimizations.

Signed-off-by: Andrew Davis <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:afd@ti.com">&lt;afd@ti.com&gt;</a>
---
 meta-ti-bsp/conf/machine/include/k3.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/m=
achine/include/k3.inc
index 2415f0ba..7c3579af 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -3,7 +3,7 @@
 require conf/machine/include/ti-soc.inc
 SOC_FAMILY:append =3D ":k3"
=20
-require conf/machine/include/arm/arch-arm64.inc
+require conf/machine/include/arm/armv8a/tune-cortexa72-cortexa53.inc
=20
 BBMULTICONFIG +=3D "k3r5"
=20
--=20
2.39.2

</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#17482): <a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-ti/messag=
e/17482__;!!G3vK!T21e4UwMAwqmb2WXp3iTH2w5zs9CtoI5wX4pmvJQk3-F9H6FDcANpOSF=
X7ctu-yvXLL-_io6FQngJ72BANL844OMEXw$">https://urldefense.com/v3/__https:/=
/lists.yoctoproject.org/g/meta-ti/message/17482__;!!G3vK!T21e4UwMAwqmb2WX=
p3iTH2w5zs9CtoI5wX4pmvJQk3-F9H6FDcANpOSFX7ctu-yvXLL-_io6FQngJ72BANL844OME=
Xw$</a>=20
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://urlde=
fense.com/v3/__https://lists.yoctoproject.org/mt/104381861/6607860__;!!G3=
vK!T21e4UwMAwqmb2WXp3iTH2w5zs9CtoI5wX4pmvJQk3-F9H6FDcANpOSFX7ctu-yvXLL-_i=
o6FQngJ72BANL8UKq3aCI$">https://urldefense.com/v3/__https://lists.yoctopr=
oject.org/mt/104381861/6607860__;!!G3vK!T21e4UwMAwqmb2WXp3iTH2w5zs9CtoI5w=
X4pmvJQk3-F9H6FDcANpOSFX7ctu-yvXLL-_io6FQngJ72BANL8UKq3aCI$</a>=20
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:meta-ti=
+owner@lists.yoctoproject.org">meta-ti+owner@lists.yoctoproject.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://urldefens=
e.com/v3/__https://lists.yoctoproject.org/g/meta-ti/unsub__;!!G3vK!T21e4U=
wMAwqmb2WXp3iTH2w5zs9CtoI5wX4pmvJQk3-F9H6FDcANpOSFX7ctu-yvXLL-_io6FQngJ72=
BANL8aX0fg_c$">https://urldefense.com/v3/__https://lists.yoctoproject.org=
/g/meta-ti/unsub__;!!G3vK!T21e4UwMAwqmb2WXp3iTH2w5zs9CtoI5wX4pmvJQk3-F9H6=
FDcANpOSFX7ctu-yvXLL-_io6FQngJ72BANL8aX0fg_c$</a>  [<a class=3D"moz-txt-l=
ink-abbreviated" href=3D"mailto:a-limaye@ti.com">a-limaye@ti.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
  </body>
</html>

--------------wX6o9to5oaiKX32IbjyNxA0Q--

