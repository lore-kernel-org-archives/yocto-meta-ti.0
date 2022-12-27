Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABC2BC4167B
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 18:36:19 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.163527.1672166173943812636
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 27 Dec 2022 10:36:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=RBX4n3lt;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2BRIaASB000951;
	Tue, 27 Dec 2022 12:36:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1672166170;
	bh=OeT7szAsd7w/OO3752IN7s5/1jeSKhAbOofO3N+LOT4=;
	h=Date:From:Subject:To:CC:In-Reply-To:References;
	b=RBX4n3ltWhnTfwCO6XNSxSFlokuXMo0sR0mGu+6YsP9NB7iNgzdSVpqGKk03Qn97B
	 mmQcUzRBeuDuchkg7I/AwE+Naa4wQjcXOqv0BWP0qRwcTXIYIwNUCgfO+vPcApVWlV
	 9p2IDbQW3DGW7qGfqiJGgGpjWYyjwP6cnvauqccA=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2BRIaAKQ121556
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Dec 2022 12:36:10 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 27
 Dec 2022 12:36:10 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 27 Dec 2022 12:36:10 -0600
Received: from [10.249.32.65] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2BRIa736065214;
	Tue, 27 Dec 2022 12:36:08 -0600
Date: Tue, 27 Dec 2022 12:36:02 -0600
From: "Sapp, Randolph" <rs@ti.com>
Subject: Re: [EXTERNAL] Re: [EXTERNAL] Re: [meta-ti] [master][PATCH v2]
 meta-ti-bsp: Graphics recipe overhaul
To: Denys Dmytriyenko <denis@denix.org>
CC: Andrew Davis <afd@ti.com>, <reatmon@ti.com>, <denys@ti.com>,
        <detheridge@ti.com>, <meta-ti@lists.yoctoproject.org>
Message-ID: <2OBKNR.ERO28SJCKO2E2@ti.com>
In-Reply-To: <20221222224746.GC22689@denix.org>
References: <20221206174553.2391187-1-rs@ti.com>
	<18ac8055-de7f-77fe-1b1b-36c5de4ef8d2@ti.com> <MY9NMR.KA5B9Y124SPL2@ti.com>
	<b9d3f0aa-ad74-0de4-acdf-a359eac5c05f@ti.com> <J3EWMR.6Q68HWA4M8303@ti.com>
	<20221219213235.GX22689@denix.org> <7Q29NR.T2R7VR8YUI2B2@ti.com>
	<20221222224746.GC22689@denix.org>
X-Mailer: geary/43.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-CZdaWHZzfPGV/GqWz9/J"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 27 Dec 2022 18:36:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15506

--=-CZdaWHZzfPGV/GqWz9/J
Content-Type: text/plain; charset="us-ascii"; format=flowed

On Thu, Dec 22 2022 at 17:47:46 -05:00:00, Denys Dmytriyenko 
<denis@denix.org> wrote:
> So, "gpu" flag specifically means HW-accelerated 3D graphics core,
> regardless of the model, generation or driver used. That covers
> SGX and Rogue now. You can still build Mesa and other graphics
> components w/o "gpu" flag for software rendering just fine.

Thanks for the history lesson, but this use of the GPU flag has changed 
over the years. We have overrides *for some reason* to drop 
functionality of certain packages when GPU is not present -- even 
though software rasterization could still be used here (take a look at 
gstreamer). This is in addition to a rickety dependency chain that 
seems to completely drop all graphics tooling when "gpu" is not present 
(talk to the guys working on am62a right now).

The issue I am trying to solve with the new machine feature is there is 
a mix of packages/pkgconfigs that should be tweaked for each of the 
following conditions:
  - sgx grahpics
  - rogue graphics
  - swrast grahpics
  - no graphics

Where the following should occur:
  - SGX grahpics should conflict with ROGUE (different umlibs, km, and 
mesa patches)
  - Both SGX and ROGUE should pull in all the same packages as swrast, 
only mesa should be configured differently (unless some userspace tools 
have their own swrast tooling which is rare but not impossible)
  - No graphics should do what dropping the GPU feature currently does 
-- completely remove all graphics libraries and swrast tools.

Now, if you believe "screen" should be used in place of the "gpu" 
machine feature in my current system; that's fine, I can update the 
configs accordingly but a new machine feature or something similar will 
be required to differentiate between SGX/RGX.



--=-CZdaWHZzfPGV/GqWz9/J
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">On Thu, Dec 22 2022 at 17:47:46 -05:00:=
00, Denys Dmytriyenko &lt;denis@denix.org&gt; wrote:<br><blockquote type=3D=
"cite"><div class=3D"plaintext" style=3D"white-space: break-spaces;">So, "g=
pu" flag specifically means HW-accelerated 3D graphics core,=20
regardless of the model, generation or driver used. That covers=20
SGX and Rogue now. You can still build Mesa and other graphics=20
components w/o "gpu" flag for software rendering just fine.
</div></blockquote><div><br></div><div>Thanks for the history lesson, but t=
his use of the GPU flag has changed over the years. We have overrides *for =
some reason* to drop functionality of certain packages when GPU is not pres=
ent -- even though software rasterization could still be used here (take a =
look at gstreamer). This is in addition to a rickety dependency chain that =
seems to completely drop all graphics tooling when "gpu" is not present (ta=
lk to the guys working on am62a right now).</div><div><br></div><div>The is=
sue I am trying to solve with the new machine feature is there is a mix of =
packages/pkgconfigs that should be tweaked for each of the following condit=
ions:</div><div>&nbsp; - sgx grahpics</div><div>&nbsp; - rogue graphics</di=
v><div>&nbsp; - swrast grahpics</div>&nbsp; - no graphics<div><br><div>Wher=
e the following should occur:</div><div>&nbsp; - SGX grahpics should confli=
ct with ROGUE (different umlibs, km, and mesa patches)</div></div><div>&nbs=
p; - Both SGX and ROGUE should pull in all the same packages as swrast, onl=
y mesa should be configured differently (unless some userspace tools have t=
heir own swrast tooling which is rare but not impossible)</div><div>&nbsp; =
- No graphics should do what dropping the GPU feature currently does -- com=
pletely remove all graphics libraries and swrast tools.</div><div><br></div=
><div>Now, if you believe "screen" should be used in place of the "gpu" mac=
hine feature in my current system; that's fine, I can update the configs ac=
cordingly but a new machine feature or something similar will be required t=
o differentiate between SGX/RGX.</div><div><br></div></div>
--=-CZdaWHZzfPGV/GqWz9/J--

