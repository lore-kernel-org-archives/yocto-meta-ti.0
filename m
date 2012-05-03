Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 62D2DE00723
	for <meta-ti@yoctoproject.org>; Thu,  3 May 2012 00:24:07 -0700 (PDT)
Received: by wgbfg15 with SMTP id fg15so1167530wgb.11
	for <meta-ti@yoctoproject.org>; Thu, 03 May 2012 00:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=Ks5w6RuZJu83HsKUMmy1qhsDe0O4RWiBOZDTz/kBSNc=;
	b=aZft3XMJFWykvPl0iYZF36+6RjSCcK+Ntdd9k/gO8/H5RY2i6XkfIPcCL8U9MbmUzx
	iUbI/LwBkbDspKBD9isVRlmsbebnZ7HdRRzvL9G3SIlEoQPitS8CtyH9695QRLeZVNSy
	5t94xWrzJJWvn3CsYFJz4SkBmZEfCgh0K+iNQmsm8n0Ek6lb91OpQszN47feyRwgbB7m
	Pz6CPMPTQIQUYYOjdtPON6I6Hjm5Q5CxSbFi6onEDEUFHSYcrea7fJGC/AcxwNbOwzaM
	bn4o4Gbm/EoMkLHog/3aJRblUaCAch9wlwdFyz1VaYtYgPL1Ve1goYW7f/yWC70e3lQy
	5F3A==
Received: by 10.216.135.196 with SMTP id u46mr658435wei.114.1336029844752;
	Thu, 03 May 2012 00:24:04 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fn2sm799709wib.0.2012.05.03.00.24.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 May 2012 00:24:03 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120503060932.GD2681@denix.org>
Date: Thu, 3 May 2012 08:25:11 +0200
Message-Id: <812B90C3-8D0A-4805-9424-1C167BEF536E@dominion.thruhere.net>
References: <20120503004302.E49A252A70@arago-project.org>
	<1DB7C838-80AE-47B8-9251-87253476B6F5@dominion.thruhere.net>
	<20120503060932.GD2681@denix.org>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkfIxIvMAqJnHD3G9MtUEVSAkF6HaJd5LLNKvLjczgCL79yFnhr31iteSg7OaYmMllY0iZc
Cc: meta-ti@yoctoproject.org, Arago Project git <git@arago-project.org>
Subject: Re: Denys Dmytriyenko : beaglebone: disable THUMB2_KERNEL in defconfig for newer binutils
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
X-List-Received-Date: Thu, 03 May 2012 07:24:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 mei 2012, om 08:09 heeft Denys Dmytriyenko het volgende geschreven:

> On Thu, May 03, 2012 at 08:02:00AM +0200, Koen Kooi wrote:
>>=20
>> Op 3 mei 2012, om 02:43 heeft Arago Project git het volgende =
geschreven:
>>=20
>>> Module: meta-ti
>>> Branch: master
>>> Commit: 3c693c26087aa148b944166083b5336f05d1c15b
>>> URL:    =
http://arago-project.org/git/meta-ti.git?a=3Dcommit;h=3D3c693c26087aa148b9=
44166083b5336f05d1c15b
>>>=20
>>> Author: Denys Dmytriyenko <denys@ti.com>
>>> Date:   Wed May  2 20:40:58 2012 -0400
>>>=20
>>> beaglebone: disable THUMB2_KERNEL in defconfig for newer binutils
>>=20
>> Wait, what? Can we actually send these changes for review first? T2 =
is=20
>> needed to meet the boot time goal, so please revert this one!
>=20
> Have another solution to get it building under recent binutils?

Patch binutils or patch the kernel. Changing the defconfig without even =
sending the patch for review is NOT the way to do it.=

