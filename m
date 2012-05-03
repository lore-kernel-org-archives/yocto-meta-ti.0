Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 53D96E0070C
	for <meta-ti@yoctoproject.org>; Thu,  3 May 2012 11:58:06 -0700 (PDT)
Received: by wibhm4 with SMTP id hm4so323323wib.11
	for <meta-ti@yoctoproject.org>; Thu, 03 May 2012 11:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=XgLChqcYkREJ4DqkCuKOhWD+Ve685DejDFa5dsXmOKY=;
	b=W55hMJM5YC3Rj58ej1AV2FJrROF3w+H0vUSYcC7gCFU/zpu3Gs4gqht9plqCSzsUPD
	kIW686dlQitw6vPNAZ1zhByHGoqwScaVaSL6f8cyH/PspKz5Cf7iVRMxbMGQsXGaAYYx
	BkdZiMyDjQvBPUdlDgTYYXWMlbe/4lJO757EVJ7e9xkU7YyB0CFWAcgoKtJdc8Wbfkp8
	b6rDGT4iGrQkDxU5D25GODC9x+Pryvm4IIh8xSqDN24Okzc119EkO2APjMpnjAryKKDF
	hIWw8JUs/YYnVoGrXDXLIlVJQxzoNxNE716elyoaPjqpzIuMP4ZyEZtNB7Ae7r2uRgI0
	+uTQ==
Received: by 10.180.98.8 with SMTP id ee8mr5941605wib.14.1336071485196;
	Thu, 03 May 2012 11:58:05 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id k6sm1557362wiy.7.2012.05.03.11.58.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 May 2012 11:58:04 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120503175239.GL2681@denix.org>
Date: Thu, 3 May 2012 20:58:02 +0200
Message-Id: <40AF7455-989D-4748-9784-0E1C7124EBDB@dominion.thruhere.net>
References: <1336026806-13314-1-git-send-email-denis@denix.org>
	<73633949-8558-4D16-958F-3BCDB1165EA8@dominion.thruhere.net>
	<20120503170208.GH2681@denix.org>
	<3FDA31A2-C5FC-4A53-9B2C-EF6BC3C85BB5@dominion.thruhere.net>
	<20120503170535.GI2681@denix.org>
	<B7677EF7-F9A8-4456-BE86-FB756A765292@dominion.thruhere.net>
	<20120503175239.GL2681@denix.org>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnfRETwWdI4M9Tk8WGYIP4+cefKSyMIrPUITlni2/wtHm1R/tOQq6w5JKKMehD4nx72DxNw
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
X-List-Received-Date: Thu, 03 May 2012 18:58:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 mei 2012, om 19:52 heeft Denys Dmytriyenko het volgende geschreven:

> On Thu, May 03, 2012 at 07:17:32PM +0200, Koen Kooi wrote:
>>=20
>> Op 3 mei 2012, om 19:05 heeft Denys Dmytriyenko het volgende =
geschreven:
>>=20
>>> On Thu, May 03, 2012 at 07:05:13PM +0200, Koen Kooi wrote:
>>>>=20
>>>>=20
>>>> Op 3 mei 2012 om 19:02 heeft Denys Dmytriyenko <denis@denix.org> =
het volgende geschreven:
>>>>=20
>>>>> On Thu, May 03, 2012 at 09:26:51AM +0200, Koen Kooi wrote:
>>>>>>=20
>>>>>> Op 3 mei 2012, om 08:33 heeft Denys Dmytriyenko het volgende =
geschreven:
>>>>>>=20
>>>>>>> From: Denys Dmytriyenko <denys@ti.com>
>>>>>>>=20
>>>>>>> * Ported from Arago
>>>>>>> * Added version 4.06.00.01 of the Graphics SDK which supports =
Power Management
>>>>>>> features for the AM335x
>>>>>>> * Use a variable PLATFORM for the directory structure since =
newer SDKs use
>>>>>>> LinuxARMV7 and older SDKs use LinuxOMAP3
>>>>>>> * Modifiy rc.pvr to check return of the insmod of pvrsrvkm. If =
this driver
>>>>>>> fails to load the devmem2 read access can put the system in a =
state where
>>>>>>> it will not come out of suspend.
>>>>>>=20
>>>>>> I keep bringing this up every few months: what's the plan to add =
the=20
>>>>>> necessary hooks to the kernel module to export the core revision =
in sysfs=20
>>>>>> instead of using devmem2? The kernel module knows about the right =
memory=20
>>>>>> addressed and turns on the clocks it needs. And better: we can =
get rid of=20
>>>>>> bogus ES revisions like 'ES8' since that's exactly the same core =
as 'ES6'=20
>>>>>> from a userspace point of view.
>>>>>=20
>>>>> Thanks, I will forward your questions and suggestions to the =
Graphics team.=20
>>>>> Meanwhile, do you have any comments about the patch?
>>>>=20
>>>> X11 support needs to get redone completely for this one, dri and =
all :(
>>>=20
>>> I haven't looked at X11 support - what's wrong with it?
>>=20
>> You need to rebuild the omap3-sgx-modules with DRI support, install =
the=20
>> extra modules, etc. Then you need to install the xorg module and hope =
the=20
>> ABIs match, install a xorg.conf snippet, etc, etc.
>>=20
>> The best way forward is to have the gfx team rebuild the X stuff =
against the=20
>> X we have in OE, not the one IMGtec delivers.
>=20
> That's a worthy goal, but may be difficult to achieve in a short time. =
You've=20
> been on the inside, you know all the limitations...
>=20
> What's the best alternative for now?

Keep using 4.05, Roger and I have some sgx testing for 4.06 planned this =
week. I really want to move to a 1.7 based system, 1.6 is just way too =
buggy.=

