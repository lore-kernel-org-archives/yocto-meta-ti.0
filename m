Return-Path: <koen@beagleboard.org>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D9FF2E013A6
	for <meta-ti@yoctoproject.org>; Tue, 15 May 2012 03:24:09 -0700 (PDT)
Received: by wibhn14 with SMTP id hn14so4215733wib.11
	for <meta-ti@yoctoproject.org>; Tue, 15 May 2012 03:24:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=McnA6FRLYTJxDE6HuiuVwhFoEakM4btcCAb/yDQQ++o=;
	b=dXRVUqML1N7FD78XL5Jvb0SoqheUDQIs8jyTD8Nxzf6Nm7IXyyz13PuElvn0oNr1XV
	FLx4Zn9sB7BdSVVRPapLQ3AK8eH0fh2mANLOe5mT7cVbnxTndQ/CtNIq/SOX5cbUV9Is
	MehlUjp/LaEtnLgQ/qjhuF4xXBwQsMUObi3TjT7QGdUGqHoErUo6PDIOecbup4HQo+98
	nUp4ck8ZpZwiY1BAp9/RgOP4T8wV+3E0LU65xfMhLxcO2DcKTqOaYf/P+P9apkM8X8/9
	oTcmrC7/PLP+iaaLYjCU8Mg2jLOYsXTn81OwlDTLlE9xUZfsZEFI7vMm5fnQhOJ1w2C0
	mWHQ==
Received: by 10.180.107.100 with SMTP id hb4mr15456653wib.22.1337077448431;
	Tue, 15 May 2012 03:24:08 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id b3sm41495335wib.4.2012.05.15.03.24.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 May 2012 03:24:07 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@beagleboard.org>
Date: Tue, 15 May 2012 12:24:05 +0200
Message-Id: <68CABEC6-8244-414C-94FB-BBBA477DA9AC@beagleboard.org>
References: <27B37797-BB4C-44C7-90D9-4E3D2192F3F7@dominion.thruhere.net>
To: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQlncOVkPJAs8OTLZFLIwXUK94DU3gwamd+X+AyTplEtfHKPqF1+DeiVyPtvJKZKi+Q+Was8
X-Mailman-Approved-At: Fri, 18 May 2012 14:59:22 -0700
Subject: Narcissus update <- IMPORTANT
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 15 May 2012 10:24:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Apologies for the massive cross-post, but most users don't read the =
development lists :) To avoid 'reply all' mistakes the addressed lists =
are in BCC. In case you are wondering which lists: the beagleboard list, =
the meta-ti list and the yocto project list.

A minor update to the below: the test server will be down for a short =
time wednesday to upgrade the RAM.

Begin doorgestuurd bericht:

> Van: Koen Kooi <koen@dominion.thruhere.net>
> Onderwerp: Narcissus update <- IMPORTANT
> Datum: 3 mei 2012 11:49:56 GMT+02:00
> Aan: Discussion of the angstrom distribution development =
<angstrom-distro-devel@linuxtogo.org>
>=20
> Hi,
>=20
> With the change to an oe-core based system a lot of things changed and =
angstrom itself has gone through some changes as well. One of those =
changes is that some packages were renamed or deprecated.=20
> To keep narcissus working the decision was made to remove all machines =
and trim the package lists.
>=20
> The new machine list matches the autobuilder: qemuarm, qemumips, =
qemuppc, qemux86, beagleboard and beagleboard. That matches the machines =
supported in OE-core and the ones I get paid to support for my day job.
>=20
> The branch: =
https://github.com/Angstrom-distribution/narcissus/commits/core-update
> Test setup: http://dominion.thruhere.net/koen/narcissus/
>=20
> The process to add machines is fairly simple:
>=20
> 1) Find the layer for the machine in =
http://www.openembedded.org/wiki/LayerIndex
> 2) Check the setup scripts to see if it's already configured
> 3) Send patch for setupscripts
> 4) Send patch for narcissus
>=20
> The process for packages is pretty much the same. The will need review =
since not every layer plays nice with others. I'm hoping that this =
process will be easy enough for people to follow while preventing =
non-working combinations to get added.
>=20
> As always, feedback appreciated.
>=20
> regards,
>=20
> Koen


