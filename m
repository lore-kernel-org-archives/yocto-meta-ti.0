Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 287A1C54E94
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 05:13:04 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.38601.1674623574969661020
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 24 Jan 2023 21:12:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=yliDybnM;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30P5CnlM110809;
	Tue, 24 Jan 2023 23:12:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674623569;
	bh=YMQpWfcfq/fJfiA5czux1RnIriYxaRwwgmNhQElm8F8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=yliDybnMt1c4OKgKs8XmZYodDqe1w3rmFSqOtJIHBmf+JRqennyJzZRQtS3zVt1TU
	 JMJbhpnEOki4zD80j3Itmo/vjhUpPv+/6nZzIlpE2E5ixLSt9UEzqDHJasnpex/5xM
	 kXPxGyN1JOSEbXEIlyek1KORWlxuDnHzXjB96PJM=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30P5CntW015358
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 Jan 2023 23:12:49 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 24
 Jan 2023 23:12:49 -0600
Received: from DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455]) by
 DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455%17]) with mapi id
 15.01.2507.016; Tue, 24 Jan 2023 23:12:49 -0600
From: "Shilwant, Chirag" <c-shilwant@ti.com>
To: "Davis, Andrew" <afd@ti.com>, "Bajjuri, Praneeth" <praneeth@ti.com>,
        "Denys Dmytriyenko" <denis@denix.org>, "Eatmon, Ryan" <reatmon@ti.com>,
        "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
CC: "Adivi, Sai Sree Kartheek" <s-adivi@ti.com>,
        "Bhagat, Paresh"
	<p-bhagat@ti.com>, "Gupta, Gyan" <g-gupta@ti.com>
Subject: Re: [meta-ti][dunfell][PATCH v2 2/2] am62xx-evm: Add support for
 AM62xx HS-SE evm
Thread-Topic: [meta-ti][dunfell][PATCH v2 2/2] am62xx-evm: Add support for
 AM62xx HS-SE evm
Thread-Index: AQHZMBhilXE6/D3DIECq0OsL3GtUV66ulktY
Date: Wed, 25 Jan 2023 05:12:49 +0000
Message-ID: <ec035e7a2e0040e58677f1b1ba4aadb7@ti.com>
References: <20230124051717.1201571-1-c-shilwant@ti.com>,<f92142fc-a2a4-221e-f05f-a07303e9fb59@ti.com>
In-Reply-To: <f92142fc-a2a4-221e-f05f-a07303e9fb59@ti.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.24.69.146]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: multipart/alternative;
	boundary="_000_ec035e7a2e0040e58677f1b1ba4aadb7ticom_"
MIME-Version: 1.0
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Jan 2023 05:13:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15648

--_000_ec035e7a2e0040e58677f1b1ba4aadb7ticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

What about DM firmware.. (ti-rtos-firmware.bb)

> This is already up-streamed in last RC cycle for both AM62X and AM62Q - h=
ttps://git.ti.com/cgit/arago-project/meta-ti/commit/?h=3Ddunfell-wip&id=3D7=
39306a769e799f8840df9113bdb0b3a2804ba98

________________________________
From: Davis, Andrew
Sent: 24 January 2023 22:52:05
To: Shilwant, Chirag; Bajjuri, Praneeth; Denys Dmytriyenko; Eatmon, Ryan; m=
eta-ti@lists.yoctoproject.org
Cc: Adivi, Sai Sree Kartheek; Bhagat, Paresh; Gupta, Gyan
Subject: Re: [meta-ti][dunfell][PATCH v2 2/2] am62xx-evm: Add support for A=
M62xx HS-SE evm

On 1/23/23 11:17 PM, Chirag Shilwant via lists.yoctoproject.org wrote:
> - Add ti-sci-firmware overrides.
> - Add support to sign ATF and OPTEE.

What about DM firmware.. (ti-rtos-firmware.bb)

Andrew

>
> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> ---
>   recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb                       | 3 ++-
>   recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 4 ++++
>   recipes-security/optee/optee-os_%.bbappend                   | 4 ++++
>   3 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-=
fw/ti-sci-fw_git.bb
> index 0fb3a832..7896c366 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> @@ -37,7 +37,8 @@ SYSFW_PREFIX_j721s2-evm-k3r5 =3D "fs"
>   SYSFW_PREFIX_j721s2-hs-evm-k3r5 =3D "fs"
>   SYSFW_PREFIX_j784s4-evm-k3r5 =3D "fs"
>   SYSFW_PREFIX_j784s4-hs-evm-k3r5 =3D "fs"
> -SYSFW_PREFIX_am62xx-evm-k3r5 =3D "fs"
> +SYSFW_PREFIX_am62xx-evm-k3r5-gp =3D "fs"
> +SYSFW_PREFIX_am62xx-evm-k3r5-hs-se =3D "fs"
>   SYSFW_PREFIX_am62xx-lp-evm-k3r5 =3D "fs"
>   SYSFW_PREFIX_am62xx-lp-evm-k3r5-hs-se =3D "fs"
>   SYSFW_PREFIX_am62axx-evm-k3r5 =3D "fs"
> diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend=
 b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> index a5eb9ff8..920cb737 100644
> --- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> +++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> @@ -31,6 +31,10 @@ do_compile_append_am64xx-evm() {
>        tfa_sign_k3hs
>   }
>
> +do_compile_append_am62xx-evm() {
> +        tfa_sign_k3hs
> +}
> +
>   do_compile_append_am62xx-lp-evm() {
>           tfa_sign_k3hs
>   }
> diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-securit=
y/optee/optee-os_%.bbappend
> index 83eb9c6a..91abbcee 100644
> --- a/recipes-security/optee/optee-os_%.bbappend
> +++ b/recipes-security/optee/optee-os_%.bbappend
> @@ -72,6 +72,10 @@ do_compile_append_am64xx-evm() {
>       optee_sign_k3hs
>   }
>
> +do_compile_append_am62xx-evm() {
> +    optee_sign_k3hs
> +}
> +
>   do_compile_append_am62xx-lp-evm() {
>       optee_sign_k3hs
>   }
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15639): https://lists.yoctoproject.org/g/meta-ti/mess=
age/15639
> Mute This Topic: https://lists.yoctoproject.org/mt/96491909/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--_000_ec035e7a2e0040e58677f1b1ba4aadb7ticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<meta content=3D"text/html; charset=3DUTF-8">
<style type=3D"text/css" style=3D"">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; col=
or:#000000; font-family:Calibri,Helvetica,sans-serif">
<p><font size=3D"2"><span style=3D"font-size:10pt; font-family:Calibri,Helv=
etica,sans-serif">What about DM firmware.. (ti-rtos-firmware.bb)</span></fo=
nt><br>
<br>
<span style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:10pt">&g=
t; This is already up-streamed in last RC cycle for both AM62X and AM62Q -
</span><a href=3D"https://git.ti.com/cgit/arago-project/meta-ti/commit/?h=
=3Ddunfell-wip&amp;id=3D739306a769e799f8840df9113bdb0b3a2804ba98" class=3D"=
x_OWAAutoLink" id=3D"LPlnk598544"><span style=3D"font-family:Calibri,Helvet=
ica,sans-serif; font-size:10pt">https://git.ti.com/cgit/arago-project/meta-=
ti/commit/?h=3Ddunfell-wip&amp;id=3D739306a769e799f8840df9113bdb0b3a2804ba9=
8</span></a><br>
</p>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Davis, Andrew<br>
<b>Sent:</b> 24 January 2023 22:52:05<br>
<b>To:</b> Shilwant, Chirag; Bajjuri, Praneeth; Denys Dmytriyenko; Eatmon, =
Ryan; meta-ti@lists.yoctoproject.org<br>
<b>Cc:</b> Adivi, Sai Sree Kartheek; Bhagat, Paresh; Gupta, Gyan<br>
<b>Subject:</b> Re: [meta-ti][dunfell][PATCH v2 2/2] am62xx-evm: Add suppor=
t for AM62xx HS-SE evm</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">On 1/23/23 11:17 PM, Chirag Shilwant via lists.yoc=
toproject.org wrote:<br>
&gt; - Add ti-sci-firmware overrides.<br>
&gt; - Add support to sign ATF and OPTEE.<br>
<br>
What about DM firmware.. (ti-rtos-firmware.bb)<br>
<br>
Andrew<br>
<br>
&gt; <br>
&gt; Signed-off-by: Chirag Shilwant &lt;c-shilwant@ti.com&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 3 &#43;&#43;-<br>
&gt;&nbsp;&nbsp; recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappe=
nd | 4 &#43;&#43;&#43;&#43;<br>
&gt;&nbsp;&nbsp; recipes-security/optee/optee-os_%.bbappend&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | 4 &#43;&#43;&#43;&#43;<br>
&gt;&nbsp;&nbsp; 3 files changed, 10 insertions(&#43;), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-s=
ci-fw/ti-sci-fw_git.bb<br>
&gt; index 0fb3a832..7896c366 100644<br>
&gt; --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb<br>
&gt; &#43;&#43;&#43; b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb<br>
&gt; @@ -37,7 &#43;37,8 @@ SYSFW_PREFIX_j721s2-evm-k3r5 =3D &quot;fs&quot;<=
br>
&gt;&nbsp;&nbsp; SYSFW_PREFIX_j721s2-hs-evm-k3r5 =3D &quot;fs&quot;<br>
&gt;&nbsp;&nbsp; SYSFW_PREFIX_j784s4-evm-k3r5 =3D &quot;fs&quot;<br>
&gt;&nbsp;&nbsp; SYSFW_PREFIX_j784s4-hs-evm-k3r5 =3D &quot;fs&quot;<br>
&gt; -SYSFW_PREFIX_am62xx-evm-k3r5 =3D &quot;fs&quot;<br>
&gt; &#43;SYSFW_PREFIX_am62xx-evm-k3r5-gp =3D &quot;fs&quot;<br>
&gt; &#43;SYSFW_PREFIX_am62xx-evm-k3r5-hs-se =3D &quot;fs&quot;<br>
&gt;&nbsp;&nbsp; SYSFW_PREFIX_am62xx-lp-evm-k3r5 =3D &quot;fs&quot;<br>
&gt;&nbsp;&nbsp; SYSFW_PREFIX_am62xx-lp-evm-k3r5-hs-se =3D &quot;fs&quot;<b=
r>
&gt;&nbsp;&nbsp; SYSFW_PREFIX_am62axx-evm-k3r5 =3D &quot;fs&quot;<br>
&gt; diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbapp=
end b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend<br>
&gt; index a5eb9ff8..920cb737 100644<br>
&gt; --- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend<br>
&gt; &#43;&#43;&#43; b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.=
bbappend<br>
&gt; @@ -31,6 &#43;31,10 @@ do_compile_append_am64xx-evm() {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tfa_sign_k3hs<br>
&gt;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt; &#43;do_compile_append_am62xx-evm() {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tfa_sign_k3hs<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt;&nbsp;&nbsp; do_compile_append_am62xx-lp-evm() {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tfa_sign_k=
3hs<br>
&gt;&nbsp;&nbsp; }<br>
&gt; diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-secu=
rity/optee/optee-os_%.bbappend<br>
&gt; index 83eb9c6a..91abbcee 100644<br>
&gt; --- a/recipes-security/optee/optee-os_%.bbappend<br>
&gt; &#43;&#43;&#43; b/recipes-security/optee/optee-os_%.bbappend<br>
&gt; @@ -72,6 &#43;72,10 @@ do_compile_append_am64xx-evm() {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; optee_sign_k3hs<br>
&gt;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt; &#43;do_compile_append_am62xx-evm() {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; optee_sign_k3hs<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt;&nbsp;&nbsp; do_compile_append_am62xx-lp-evm() {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; optee_sign_k3hs<br>
&gt;&nbsp;&nbsp; }<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#15639): <a href=3D"https://lists.yoctoproject.org/=
g/meta-ti/message/15639">
https://lists.yoctoproject.org/g/meta-ti/message/15639</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/96491909=
/3619733">https://lists.yoctoproject.org/mt/96491909/3619733</a><br>
&gt; Group Owner: meta-ti&#43;owner@lists.yoctoproject.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-ti/unsub=
">https://lists.yoctoproject.org/g/meta-ti/unsub</a> [afd@ti.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
</div>
</span></font>
</body>
</html>

--_000_ec035e7a2e0040e58677f1b1ba4aadb7ticom_--

