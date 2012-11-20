Return-Path: <ndec13@gmail.com>
Received: from mail-qa0-f41.google.com (mail-qa0-f41.google.com
	[209.85.216.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A7199E0141C
	for <meta-ti@yoctoproject.org>; Tue, 20 Nov 2012 08:50:56 -0800 (PST)
Received: by mail-qa0-f41.google.com with SMTP id c26so1004371qad.14
	for <meta-ti@yoctoproject.org>; Tue, 20 Nov 2012 08:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=D6yCTxcsMYoyfj1e88gm4KSoO4BCPtbGPt8SYsRk0fs=;
	b=ZS3vl0aUUPLISpkRgF7ST0va/Gu2RXGI2OApXVKSQBnhMhHpN6VreL0h21cWFC4Oj4
	D9y/eaR4Q6XePBk7lvkmF0mwkx6Uq1o/pCi69pcZKbv6NPZ6R+3R+h+TCrri/xT453s5
	7n4nss1I2UuEpz5UmxhaaE6uiprIu55pMAsmZFc2ExbfaQejttJNs8TSQgWamw6txD9C
	/kYmK6WTR99f7XcJyRzkr/yPIiorIvgQF9V1Hrg3Ij5b5RO32itdAySd0BTiIdB3bjgu
	FyoyIgBjUrXJn0NdRkvS+mO9u3EdgQ1ylDbWOsKIx9KxYJeWBCvr8C4zGzLilL6PvzcC
	UMmw==
Received: by 10.229.177.72 with SMTP id bh8mr3709354qcb.10.1353430255935; Tue,
	20 Nov 2012 08:50:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.49.121.161 with HTTP; Tue, 20 Nov 2012 08:50:35 -0800 (PST)
From: Nicolas Dechesne <ndec13@gmail.com>
Date: Tue, 20 Nov 2012 17:50:35 +0100
Message-ID: <CAOT3miJT7PUO5_PRSjMwg9razGMxCzV6785Wkq2OkqO78X4pcQ@mail.gmail.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: xf86-video-omap and libdrm for OMAP
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
X-List-Received-Date: Tue, 20 Nov 2012 16:50:56 -0000
Content-Type: multipart/alternative; boundary=0016369f9a74a2222204cef00991

--0016369f9a74a2222204cef00991
Content-Type: text/plain; charset=ISO-8859-1

hi

i just noticed that the recipe for xf86-video-omap was just merged into
poky/master, and that libdrm was updated as well (and OMAP experimental
support was enabled too):

0ed7c53 xf86-video-omap: add new recipe to follow the maintained repo
cb758f9 libdrm: upgrade to 2.4.40

from a quick review, i believe this should supersede the recipes from
meta-ti that got merged recently:

410dc02 xf86-video-omap: add new recipe for OMAP4/5 X11 video driver
cce5a7a libdrm: enable omap experimental api support

i won't be able to get that tested in the next couple of days, very likely,
so i wanted to know:

- if anyone tested poky/master (or oe-core as this came from oe-core) on
panda and/or beagle?
- what is the policy in this situation? should we simply remove our recipes
from meta-ti?

cheers

nicolas

--0016369f9a74a2222204cef00991
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

hi<div><br></div><div>i just noticed that the recipe for xf86-video-omap wa=
s just merged into poky/master,=A0and that libdrm was updated as well (and =
OMAP experimental support was enabled too):</div><div><br></div><div><div>

0ed7c53 xf86-video-omap: add new recipe to follow the maintained repo</div>=
</div><div><div>cb758f9 libdrm: upgrade to 2.4.40</div></div><div><br></div=
><div>from a quick review, i believe this should=A0supersede the recipes fr=
om meta-ti that got merged recently:</div>

<div><br></div><div>410dc02 xf86-video-omap: add new recipe for OMAP4/5 X11=
 video driver</div><div><div>cce5a7a libdrm: enable omap experimental api s=
upport</div></div><div><br></div><div>i won&#39;t be able to get that teste=
d in the next couple of days, very likely, so i wanted to know:</div>

<div><br></div><div>- if anyone tested poky/master (or oe-core as this came=
 from oe-core) on panda and/or beagle?</div><div>- what is the policy in th=
is situation? should we simply remove our recipes from meta-ti?</div><div>

<br></div><div>cheers</div><div><br></div><div>nicolas</div><div><br></div>=
<div><br></div><div><br></div>

--0016369f9a74a2222204cef00991--
