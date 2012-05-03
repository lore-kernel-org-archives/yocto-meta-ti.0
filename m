Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8C385E0044D
	for <meta-ti@yoctoproject.org>; Thu,  3 May 2012 10:17:36 -0700 (PDT)
Received: by wgbfg15 with SMTP id fg15so1599667wgb.11
	for <meta-ti@yoctoproject.org>; Thu, 03 May 2012 10:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=gj6kykWYodD4zePeqz8FA69J9D5r75ZujGECpD+8QrE=;
	b=RmE8wiK5q5xUjYwy5AQSvBQhoBxmU4lBLN6ukJkTqNn1KeNxReoxZq2jmwaarLttRF
	MVbdYYe/qTcU6GHVcVn9ERBKfaMI7hONguksFyOjaQHZ+XHImXV8RdDYmBEOKJMbc1qK
	rvYb7CIx4F9GMIzisrVBcxQHxmp0r2zy4IwQLZfgT95udVUAA+jgREpNQxd44Lhw7V42
	O9+p++3p9039lSrX8HwLAKNGtS/9WXSfaLsSdlJi/S9paQBRNL+JW0WqmdB7ws7TQtPi
	EhCWlxEDS8Z1m8f5m4YruLIoubKUvSPkvI9GPDdkXjznHj6oom39gDg53LK8RmAxiosz
	qZDA==
Received: by 10.180.81.135 with SMTP id a7mr5234101wiy.16.1336065455326;
	Thu, 03 May 2012 10:17:35 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id o2sm5052325wiv.11.2012.05.03.10.17.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 May 2012 10:17:34 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120503170535.GI2681@denix.org>
Date: Thu, 3 May 2012 19:17:32 +0200
Message-Id: <B7677EF7-F9A8-4456-BE86-FB756A765292@dominion.thruhere.net>
References: <1336026806-13314-1-git-send-email-denis@denix.org>
	<73633949-8558-4D16-958F-3BCDB1165EA8@dominion.thruhere.net>
	<20120503170208.GH2681@denix.org>
	<3FDA31A2-C5FC-4A53-9B2C-EF6BC3C85BB5@dominion.thruhere.net>
	<20120503170535.GI2681@denix.org>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkpAALb9pFaD53Gs3P93o2bSgk2crptMlqvbzfaGbMX4LtBjoP9yiyQN342agVafCA5xkiH
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
X-List-Received-Date: Thu, 03 May 2012 17:17:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 mei 2012, om 19:05 heeft Denys Dmytriyenko het volgende geschreven:

> On Thu, May 03, 2012 at 07:05:13PM +0200, Koen Kooi wrote:
>>=20
>>=20
>> Op 3 mei 2012 om 19:02 heeft Denys Dmytriyenko <denis@denix.org> het =
volgende geschreven:
>>=20
>>> On Thu, May 03, 2012 at 09:26:51AM +0200, Koen Kooi wrote:
>>>>=20
>>>> Op 3 mei 2012, om 08:33 heeft Denys Dmytriyenko het volgende =
geschreven:
>>>>=20
>>>>> From: Denys Dmytriyenko <denys@ti.com>
>>>>>=20
>>>>> * Ported from Arago
>>>>> * Added version 4.06.00.01 of the Graphics SDK which supports =
Power Management
>>>>> features for the AM335x
>>>>> * Use a variable PLATFORM for the directory structure since newer =
SDKs use
>>>>> LinuxARMV7 and older SDKs use LinuxOMAP3
>>>>> * Modifiy rc.pvr to check return of the insmod of pvrsrvkm. If =
this driver
>>>>> fails to load the devmem2 read access can put the system in a =
state where
>>>>> it will not come out of suspend.
>>>>=20
>>>> I keep bringing this up every few months: what's the plan to add =
the=20
>>>> necessary hooks to the kernel module to export the core revision in =
sysfs=20
>>>> instead of using devmem2? The kernel module knows about the right =
memory=20
>>>> addressed and turns on the clocks it needs. And better: we can get =
rid of=20
>>>> bogus ES revisions like 'ES8' since that's exactly the same core as =
'ES6'=20
>>>> from a userspace point of view.
>>>=20
>>> Thanks, I will forward your questions and suggestions to the =
Graphics team.=20
>>> Meanwhile, do you have any comments about the patch?
>>=20
>> X11 support needs to get redone completely for this one, dri and all =
:(
>=20
> I haven't looked at X11 support - what's wrong with it?

You need to rebuild the omap3-sgx-modules with DRI support, install the =
extra modules, etc. Then you need to install the xorg module and hope =
the ABIs match, install a xorg.conf snippet, etc, etc.

The best way forward is to have the gfx team rebuild the X stuff against =
the X we have in OE, not the one IMGtec delivers.=20=

