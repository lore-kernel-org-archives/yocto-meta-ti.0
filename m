Return-Path: <jtdannenbring@gmail.com>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8B79BE00496
	for <meta-ti@yoctoproject.org>; Fri, 25 Jan 2013 14:51:30 -0800 (PST)
Received: by mail-oa0-f45.google.com with SMTP id m1so1103089oag.32
	for <meta-ti@yoctoproject.org>; Fri, 25 Jan 2013 14:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type; bh=tl41JuFDWKSekre+iwIfc1oPEun8OlTY7SaYopV/2kE=;
	b=XRYQC6sZK1pbR80gSCrMqps7ZUroNRjN9Gkxw//06vMb/EFfyl9sc7vLF6Tda8A5NN
	Dhs1lvKDzbd8c2yGg2cy7gEATJmqqoG2SNBb7kqjLvuS/KWXrrAkRWeu79iHZqKE9pCR
	p6y42z2vuie1uWbSXTdwNKFfQriIp1FWe38BVguP0dGzSP2GFA0obD4bG4qKVehc0rfQ
	ytMxY+1uKY1G7s1MUtPRxjNWaEnyESxP6fXftObar1bLSQXP1/3C8ruJ9jdlcwGFaVfu
	f6tZOAH6J6WykzvbjRK0xO6jUf4alwbtK07aF0NUykMPciS+BexpbNjTlpRRtvJ+e0px
	6eUw==
MIME-Version: 1.0
X-Received: by 10.182.54.103 with SMTP id i7mr5754598obp.62.1359154289805;
	Fri, 25 Jan 2013 14:51:29 -0800 (PST)
Received: by 10.182.64.37 with HTTP; Fri, 25 Jan 2013 14:51:29 -0800 (PST)
Message-ID: <CACMnT39zosRxQfXXoQ8Pbwwtqa2GzKqyqWj2bgU23u4SwM_ypQ@mail.gmail.com>
From: Jesse Dannenbring <jtdannenbring@gmail.com>
To: meta-ti@yoctoproject.org
X-Mailman-Approved-At: Mon, 11 Feb 2013 11:48:46 -0800
Subject: Error building after "mesa-dri update to 9.0.1"
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
Date: Fri, 25 Jan 2013 22:51:30 -0000
X-Original-Date: Fri, 25 Jan 2013 14:51:29 -0800
X-List-Received-Date: Fri, 25 Jan 2013 22:51:30 -0000
Content-Type: multipart/alternative; boundary=14dae93a113da388c304d424c469

--14dae93a113da388c304d424c469
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I previously was building meta-ti without issue but I repeated the process
recently and found that the patch on 2013-01-10 broke my build:

bitbake -c fetchall core-image-minimal
Pseudo is not present but is required, building this first before the main
build
Parsing recipes: 100% |#########################################| Time:
00:02:54
Parsing of 891 .bb files complete (0 cached, 891 parsed). 1197 targets, 64
skipped, 7 masked, 0 errors.
ERROR: No recipes available for:

/home/jesse/yocto/poky-danny-8.0/meta-ti/recipes-graphics/mesa/mesa-dri_9.0.1.bbappend
ERROR: Command execution failed: Exited with 1

--14dae93a113da388c304d424c469
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style>Hello,</div><div style><br></div><div style>I p=
reviously was building meta-ti without issue but I repeated the process rec=
ently and found that the patch on 2013-01-10 broke my build:</div><div styl=
e>
<br></div><div>bitbake -c fetchall core-image-minimal</div><div>Pseudo is n=
ot present but is required, building this first before the main build</div>=
<div>Parsing recipes: 100% |#########################################| Time=
: 00:02:54</div>
<div>Parsing of 891 .bb files complete (0 cached, 891 parsed). 1197 targets=
, 64 skipped, 7 masked, 0 errors.</div><div>ERROR: No recipes available for=
:</div><div>=A0 /home/jesse/yocto/poky-danny-8.0/meta-ti/recipes-graphics/m=
esa/mesa-dri_9.0.1.bbappend</div>
<div>ERROR: Command execution failed: Exited with 1</div><div><br></div><di=
v style><br></div></div>

--14dae93a113da388c304d424c469--
