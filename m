Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 59623E002AB
	for <meta-ti@yoctoproject.org>; Tue, 18 Sep 2012 23:28:09 -0700 (PDT)
Received: by wibhq12 with SMTP id hq12so631278wib.11
	for <meta-ti@yoctoproject.org>; Tue, 18 Sep 2012 23:28:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=QoYKdcHbvdeljuxP93rNqi8lunTbvOa6jgzRoZiObOY=;
	b=o2KFBQPknWpNCCuMJTVoYsN+nsD32EseBcIryyID4RJ7R9vS/GpBgbQD1woXMLkEdW
	OWa7JIL2+KbNVenp09ksBog3luuY7mwfd4ZEtoPZZh1w6idlzOrQi/THVDLyXSGJ/032
	uzrWlgLzy7bysN/xIQJJZotK4ZN47eGR6nkUPXgcunVYeN6KJsoknCG2TNNe7kRSpce4
	Eh2Fq9UQCbXpYIwW4ULNlXK1QLK6eXIY+QvdWNVR4yg3WHt2XI4HXtrZKRyaglF43Vyk
	jcJor2aOeyNpw5CcSrKu2D/UvH/0cyJ3/XokvsXDNoDJ7ex2KqiDHXfYepQlVx5l6HlW
	Idiw==
Received: by 10.180.100.35 with SMTP id ev3mr4628545wib.7.1348036088226;
	Tue, 18 Sep 2012 23:28:08 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id fr4sm3399789wib.8.2012.09.18.23.28.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 23:28:07 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAOT3mi+f4Wsaba4S3uiw1p27R585EBY4OSA8K=pPCpbATwRmcA@mail.gmail.com>
Date: Wed, 19 Sep 2012 08:28:07 +0200
Message-Id: <04B810D6-38B8-44DC-9752-FAB02ADD253E@dominion.thruhere.net>
References: <CAOT3mi+f4Wsaba4S3uiw1p27R585EBY4OSA8K=pPCpbATwRmcA@mail.gmail.com>
To: Nicolas Dechesne <ndec13@gmail.com>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQnQD1fKsYDNVYX8AUA16f51BmmMZsQIZiToO5rgDD/ZRZjIbDU1YGpJpxl/HAsCBRFAzWQZ
Cc: meta-ti@yoctoproject.org
Subject: Re: building yocto images with meta-ti
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
X-List-Received-Date: Wed, 19 Sep 2012 06:28:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 19 sep. 2012, om 08:16 heeft Nicolas Dechesne <ndec13@gmail.com> het =
volgende geschreven:

> hi there,
>=20
> i was able to build a 'vanilla' yocto image using the yocto git repo.

You mean poky, right?

> then i wanted to add meta-ti layer. so i have done the following:
>=20
> - clone git://git.yoctoproject.org/meta-ti
> - modify BBLAYERS in conf/bblayers.conf to add meta-ti
>=20
> i can verify that meta-ti layer is configured properly as
> bitbake-layers show-layers shows it just fine (with priority 10).
>=20
> However parsing recipes failed with:
>=20
> Loaded 23 entries from dependency cache.
> ERROR: ExpansionError during parsing
> =
/work/yocto/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager_=
1.24.02.09.bb:
> Failure expanding variable FILESPATH, expression was
> ${@base_set_filespath([
> =
"/work/yocto/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager=
-1_1_24_02_09-${MACHINE_KERNEL_PR}e",
> =
"/work/yocto/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager=
-1_24_02_09",
> =
"/work/yocto/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager=
",
> =
"/work/yocto/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager=
-1_24_02_09",
> =
"/work/yocto/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager=
",
> "/work/yocto/meta-ti/recipes-ti/local-power-manager/files",
> "/work/yocto/meta-ti/recipes-ti/local-power-manager" ], d)} which
> triggered exception SyntaxError: EOL while scanning string literal
> (FILESPATH, line 1)
> ERROR: Command execution failed: Exited with 1
>=20
> is there a particular commit in yocto that meta-ti requires?
>=20
> how do you guys generate vanilla yocto images with meta-ti?

You mean poky, right? Have a look at the README.=

