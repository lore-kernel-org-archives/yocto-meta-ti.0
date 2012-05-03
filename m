Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7ED90E00596
	for <meta-ti@yoctoproject.org>; Thu,  3 May 2012 10:04:17 -0700 (PDT)
Received: by wgbfg15 with SMTP id fg15so1589101wgb.11
	for <meta-ti@yoctoproject.org>; Thu, 03 May 2012 10:04:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to
	:x-gm-message-state;
	bh=Y1GdmgW5FmazaVaEIF7syLB79g9HMEqXTftQNR5G8bU=;
	b=VxSODrnhdLzBlzeHqnm5NkwupdqKioCH6DPG4BjGP/N2uxg5Vtvsjn685tehqHYNVA
	w8LjiPHScKGLukuKUwNIajK11/UYYgfxtRptcqlskT6Nz7d2oysUcO5NYCudOWFfgN+Q
	y+g8l0SxgcGSRu4QFvlCEFDtgzHjGLPcfZYy+g0K2TGTue6zDjSk7BYeXf4po0IpJRii
	Q3Gp3Nc9+UJGyXF0w80p+lqVIY6tQzRqZFQYeJ0WZm7mZ/QwyvO6GVid2DZTYI+JQEOw
	aoIdkvGzIMEaBuGIOzwBLou7J29d6ez90DDQdEkLv5452Xf+v3wib5bc7RXS3kPMiJhk
	fllA==
Received: by 10.216.143.154 with SMTP id l26mr1882237wej.86.1336064656054;
	Thu, 03 May 2012 10:04:16 -0700 (PDT)
Received: from [172.20.1.66] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id e6sm886706wix.8.2012.05.03.10.04.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 May 2012 10:04:15 -0700 (PDT)
References: <1336026806-13314-1-git-send-email-denis@denix.org>
	<73633949-8558-4D16-958F-3BCDB1165EA8@dominion.thruhere.net>
	<20120503170208.GH2681@denix.org>
In-Reply-To: <20120503170208.GH2681@denix.org>
Mime-Version: 1.0 (1.0)
Message-Id: <3FDA31A2-C5FC-4A53-9B2C-EF6BC3C85BB5@dominion.thruhere.net>
X-Mailer: iPad Mail (9B176)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 3 May 2012 19:05:13 +0200
To: Denys Dmytriyenko <denis@denix.org>
X-Gm-Message-State: ALoCoQkCuhwj36aJKY4ndCvXcC3cwJtlnrCuWOlN2uIbgghZcsJeU3en/IE/C/KJHksf5FFzgXk1
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] omap3-sgx-modules, libgles-omap3: add version 4.06.00.01
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
X-List-Received-Date: Thu, 03 May 2012 17:04:17 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 3 mei 2012 om 19:02 heeft Denys Dmytriyenko <denis@denix.org> het volgend=
e geschreven:

> On Thu, May 03, 2012 at 09:26:51AM +0200, Koen Kooi wrote:
>>=20
>> Op 3 mei 2012, om 08:33 heeft Denys Dmytriyenko het volgende geschreven:
>>=20
>>> From: Denys Dmytriyenko <denys@ti.com>
>>>=20
>>> * Ported from Arago
>>> * Added version 4.06.00.01 of the Graphics SDK which supports Power Mana=
gement
>>> features for the AM335x
>>> * Use a variable PLATFORM for the directory structure since newer SDKs u=
se
>>> LinuxARMV7 and older SDKs use LinuxOMAP3
>>> * Modifiy rc.pvr to check return of the insmod of pvrsrvkm. If this driv=
er
>>> fails to load the devmem2 read access can put the system in a state wher=
e
>>> it will not come out of suspend.
>>=20
>> I keep bringing this up every few months: what's the plan to add the=20
>> necessary hooks to the kernel module to export the core revision in sysfs=
=20
>> instead of using devmem2? The kernel module knows about the right memory=20=

>> addressed and turns on the clocks it needs. And better: we can get rid of=
=20
>> bogus ES revisions like 'ES8' since that's exactly the same core as 'ES6'=
=20
>> from a userspace point of view.
>=20
> Thanks, I will forward your questions and suggestions to the Graphics team=
.=20
> Meanwhile, do you have any comments about the patch?

X11 support needs to get redone completely for this one, dri and all :(



>=20
> --=20
> Denys

