Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16631C77B73
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 04:32:50 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.6417.1685507562064807614
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 May 2023 21:32:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=H/wemrIs;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: m-chawdhry@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34V4Wf6C078409
	for <meta-ti@lists.yoctoproject.org>; Tue, 30 May 2023 23:32:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685507561;
	bh=w6ysLlnrNWAE6vx4kVz1hwhv0mZoK+TRwIWcWVVGy0Q=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=H/wemrIsCB16hETIqLx/EvJATSFeJzfCA04572X+BJhLuZUmhdTtLmqnq9VZllRne
	 n7cFJB94Yt6uaOfRISEVk6ke71V3veVRRBvkK0hhmS3lGuzxaFzo1XHmDoSCaMy9jq
	 8pfsxZ9pYApXceU7iAevMZvEkxqN0N/ZbpF6Xr9U=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34V4WfuA019310
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 30 May 2023 23:32:41 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 30
 May 2023 23:32:40 -0500
Received: from DFLE103.ent.ti.com ([fe80::7431:ea48:7659:dc14]) by
 DFLE103.ent.ti.com ([fe80::7431:ea48:7659:dc14%17]) with mapi id
 15.01.2507.023; Tue, 30 May 2023 23:32:40 -0500
From: "Chawdhry, Manorit" <m-chawdhry@ti.com>
To: "Eatmon, Ryan" <reatmon@ti.com>, "Limaye, Aniket" <a-limaye@ti.com>,
        "Dmytriyenko, Denys" <denys@ti.com>,
        "meta-ti@lists.yoctoproject.org"
	<meta-ti@lists.yoctoproject.org>,
        "Davis, Andrew" <afd@ti.com>, "Sapp,
 Randolph" <rs@ti.com>
Subject: Re: Fit image signature
Thread-Topic: Fit image signature
Thread-Index: AQHZkuHYBdk3YnQIk0ib5byqjXn+/K9zAhyAgAAJcwCAAMBShA==
Date: Wed, 31 May 2023 04:32:40 +0000
Message-ID: <1e8bfe9984c043419b0dcc8a309a9b26@ti.com>
References: <5dd77f89-8c9c-e135-5db9-a526d4b3b8de@ti.com>
 <aff76fb0c59b4de0800708f45df6b9dd@ti.com>,<8d509990-d5ce-2df9-8e3d-e71873e4cffe@ti.com>
In-Reply-To: <8d509990-d5ce-2df9-8e3d-e71873e4cffe@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.145.216]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: multipart/alternative;
	boundary="_000_1e8bfe9984c043419b0dcc8a309a9b26ticom_"
MIME-Version: 1.0
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 31 May 2023 04:32:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16644

--_000_1e8bfe9984c043419b0dcc8a309a9b26ticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ryan,


Would you be able to provide me an oe-core fork with your vendor specific c=
hanges so that I can get unblocked on fit signature testing?


Regards,

Manorit

________________________________
From: Eatmon, Ryan
Sent: Tuesday, May 30, 2023 5:33:32 PM
To: Limaye, Aniket; Chawdhry, Manorit; Dmytriyenko, Denys; meta-ti@lists.yo=
ctoproject.org; Davis, Andrew; Sapp, Randolph
Subject: Re: Fit image signature


That is correct.  Rather than diving deeper into mire of copy all of
those classes we are working to get our changes accepted into the
kirkstone upstream.  Randolph and I will continue today looking into that.


On 5/30/2023 6:29, Limaye, Aniket wrote:
> Here's more info, if needed, :
>
> The deploy for the .dtb is being done from here : https://git.openembedde=
d.org/openembedded-core/tree/meta/classes/kernel-fitimage.bbclass?h=3Dkirks=
tone#n755
> The class is appending the functionality to kernel_do_deploy
>
> Whereas our linux-ti-staging is not using that function at all. We are us=
ing kernel_vendor_dtb_do_deploy from here : https://git.ti.com/cgit/arago-p=
roject/meta-ti/tree/meta-ti-bsp/classes/kernel_vendor_dtb.bbclass?h=3Dkirks=
tone#n776
>
> Regards,
> Aniket
>
>
> -----Original Message-----
> From: Chawdhry, Manorit <m-chawdhry@ti.com>
> Sent: Tuesday, May 30, 2023 4:01 PM
> To: Eatmon, Ryan <reatmon@ti.com>; Dmytriyenko, Denys <denys@ti.com>; met=
a-ti@lists.yoctoproject.org; Davis, Andrew <afd@ti.com>; Limaye, Aniket <a-=
limaye@ti.com>
> Subject: Fit image signature
>
> Hi Ryan,
>
> I was recently trying to enable the fit signature locally on yocto and fa=
ced a warning..
>
> WARNING: u-boot-ti-staging-1_2023.04+gitAUTOINC+010afc1fe7-r0 do_deploy: =
Failure while adding public key to u-boot binary. Verified boot won't be av=
ailable.
>
> I was talking to Aniket about it and he let me know that there is some ve=
ndor specific override in the kernel class now and am worried that this ven=
dor specific override might not be compatible with the fit signature that i=
s there in the upstream. Can you let me know if this vendor specific class =
has the things related to enabling the fit signature booting with uboot?
>
> Regards,
> Manorit
>

--
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

--_000_1e8bfe9984c043419b0dcc8a309a9b26ticom_
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
<p>Ryan,</p>
<p><br>
</p>
<p>Would you be able to provide me an oe-core fork with your vendor specifi=
c changes so that I can get unblocked on fit signature testing?</p>
<p><br>
</p>
<p>Regards,</p>
<p>Manorit<br>
</p>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Eatmon, Ryan<br>
<b>Sent:</b> Tuesday, May 30, 2023 5:33:32 PM<br>
<b>To:</b> Limaye, Aniket; Chawdhry, Manorit; Dmytriyenko, Denys; meta-ti@l=
ists.yoctoproject.org; Davis, Andrew; Sapp, Randolph<br>
<b>Subject:</b> Re: Fit image signature</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText"><br>
That is correct.&nbsp; Rather than diving deeper into mire of copy all of <=
br>
those classes we are working to get our changes accepted into the <br>
kirkstone upstream.&nbsp; Randolph and I will continue today looking into t=
hat.<br>
<br>
<br>
On 5/30/2023 6:29, Limaye, Aniket wrote:<br>
&gt; Here's more info, if needed, :<br>
&gt; <br>
&gt; The deploy for the .dtb is being done from here : <a href=3D"https://g=
it.openembedded.org/openembedded-core/tree/meta/classes/kernel-fitimage.bbc=
lass?h=3Dkirkstone#n755">
https://git.openembedded.org/openembedded-core/tree/meta/classes/kernel-fit=
image.bbclass?h=3Dkirkstone#n755</a><br>
&gt; The class is appending the functionality to kernel_do_deploy<br>
&gt; <br>
&gt; Whereas our linux-ti-staging is not using that function at all. We are=
 using kernel_vendor_dtb_do_deploy from here :
<a href=3D"https://git.ti.com/cgit/arago-project/meta-ti/tree/meta-ti-bsp/c=
lasses/kernel_vendor_dtb.bbclass?h=3Dkirkstone#n776">
https://git.ti.com/cgit/arago-project/meta-ti/tree/meta-ti-bsp/classes/kern=
el_vendor_dtb.bbclass?h=3Dkirkstone#n776</a><br>
&gt; <br>
&gt; Regards,<br>
&gt; Aniket<br>
&gt; <br>
&gt; <br>
&gt; -----Original Message-----<br>
&gt; From: Chawdhry, Manorit &lt;m-chawdhry@ti.com&gt;<br>
&gt; Sent: Tuesday, May 30, 2023 4:01 PM<br>
&gt; To: Eatmon, Ryan &lt;reatmon@ti.com&gt;; Dmytriyenko, Denys &lt;denys@=
ti.com&gt;; meta-ti@lists.yoctoproject.org; Davis, Andrew &lt;afd@ti.com&gt=
;; Limaye, Aniket &lt;a-limaye@ti.com&gt;<br>
&gt; Subject: Fit image signature<br>
&gt; <br>
&gt; Hi Ryan,<br>
&gt; <br>
&gt; I was recently trying to enable the fit signature locally on yocto and=
 faced a warning..<br>
&gt; <br>
&gt; WARNING: u-boot-ti-staging-1_2023.04&#43;gitAUTOINC&#43;010afc1fe7-r0 =
do_deploy: Failure while adding public key to u-boot binary. Verified boot =
won't be available.<br>
&gt; <br>
&gt; I was talking to Aniket about it and he let me know that there is some=
 vendor specific override in the kernel class now and am worried that this =
vendor specific override might not be compatible with the fit signature tha=
t is there in the upstream. Can you
 let me know if this vendor specific class has the things related to enabli=
ng the fit signature booting with uboot?<br>
&gt; <br>
&gt; Regards,<br>
&gt; Manorit<br>
&gt; <br>
<br>
-- <br>
Ryan Eatmon&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; reatmon@ti.com<br>
-----------------------------------------<br>
Texas Instruments, Inc.&nbsp; -&nbsp; LCPD&nbsp; -&nbsp; MGTS<br>
</div>
</span></font>
</body>
</html>

--_000_1e8bfe9984c043419b0dcc8a309a9b26ticom_--

