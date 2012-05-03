Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1908CE0044D
	for <meta-ti@yoctoproject.org>; Thu,  3 May 2012 10:20:50 -0700 (PDT)
Received: by wibhm4 with SMTP id hm4so247645wib.5
	for <meta-ti@yoctoproject.org>; Thu, 03 May 2012 10:20:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=AwbkZaimbXf99Fh8m/9/UkcjGYdR8yUSK52hC951BeE=;
	b=h+AWjg6aLsgIOldaAHJqikQCmA+0i8p33B+SXWpJQdxPsPg3tDV7OmfgiJRg0yblx3
	vFQxb0ZNf+IfFEKgGEMOzur9ryAKlvMUCmGVj2VOS4ZAHs7rNS2lktBsPjiUa0PYoIs9
	BMAs3I3TjtqkgrdrW/6g5cdoL5DPVzfyaSQRx5Rnl63+gKYvQRc2C95OLsJcVsR+Z58T
	9fv5HvF8TA+TvNDeH89iOmFrDo0QK/wMw6DuUIu0wkBVMsUeca5eXLOooJx5+OZbnVWC
	X7mwuynT7C8t7y1E+TPbs1IcNT6OhB9j6UGSV60PGOXclErsdWBV2xGJsw8XaIpK0+9C
	UKIA==
Received: by 10.180.82.136 with SMTP id i8mr5166550wiy.19.1336065649973;
	Thu, 03 May 2012 10:20:49 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ca3sm986921wib.6.2012.05.03.10.20.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 May 2012 10:20:49 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120503171556.GJ2681@denix.org>
Date: Thu, 3 May 2012 19:20:47 +0200
Message-Id: <9F436296-853B-4A02-97B4-77B491AD6D2B@dominion.thruhere.net>
References: <1335899212-29869-1-git-send-email-koen@dominion.thruhere.net>
	<20120503171556.GJ2681@denix.org>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQlHvdWKiZKO6HP3Nocx/wDZ0m/38z7vOSBllwpjAN8CfX51YU3/hknynJyqXcQjDAcxWHFU
Cc: meta-ti@yoctoproject.org
Subject: Re: [RFC][PATCH 1/5] linux-mainline 3.2: kernel recipe based on mainline 3.2.16 with additional patches for e.g. beagleboard on top
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
X-List-Received-Date: Thu, 03 May 2012 17:20:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 mei 2012, om 19:15 heeft Denys Dmytriyenko het volgende geschreven:

> It's a heavy patch, but my question is - how is it different from =
linux-3.0 we=20
> already have, besides the version upgrade to 3.2? Why is it called=20
> linux-mainline, the old linux recipe is also mainline with beagle =
patches.
>=20
> Basically, I'm trying to understand 2 things here:
> - what's the difference between this beagle patch set and the one =
applied on=20
> top of e.g. 3.0.28? Is it a different dev model, goals, owner or =
anything else

Pretty much the same, with less PM. The goal is to keep moving closer to =
mainline and to a recent mainline version. With this update we'll be =
using the same kernel Robert Nelson uses for his ubuntu builds.

> - why the name change with -mainline suffix?

To namespace it like we planned for our u-boot recipes, a number of =
layers have linux_3.2.bb recipes that would clash :( I'm not really fond =
of it, but that's the price we pay for all these layers.

regards,

Koen=

