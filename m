Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D79BAE0070C
	for <meta-ti@yoctoproject.org>; Thu,  3 May 2012 23:18:16 -0700 (PDT)
Received: by wgbfg15 with SMTP id fg15so1991050wgb.11
	for <meta-ti@yoctoproject.org>; Thu, 03 May 2012 23:18:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=IRjaal1rVJlAqZsNDpHOj9B9yW69g1YIyJAz5IbdL7Y=;
	b=osT3ISQc5MJCR+M0ov8yOD+FoeLNFB44X4H02om2sZvgMr95IH65+ltd9YmXhUqXmt
	l6xRYBA1h4xIVPxQFd8Mv9MbV6z+yPOXXvRfZ3XsW9FByTSOANrxWuVSkVvOqjLn6hbj
	C0ViWPMmHRw5pRfHJce1Q+7wdTR7+BcxK9H/jX/pTDigOAHJVn7Pyw0wILDjuAYRig52
	Uzsw7rb6qyNazymnaGeE/LchcqSOw7/V11vQP9ROQTtbJsP7NjhAF0Qe9jTTheyO33nB
	Sm7uirrMPpbZ+0QTRaiY6Cjp7gUTqh0tQl9nO7vRLVvcRw/yXP6YT236HWle4rYatBqL
	fYJA==
Received: by 10.180.100.2 with SMTP id eu2mr1218449wib.1.1336112295434;
	Thu, 03 May 2012 23:18:15 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id gg2sm11649469wib.7.2012.05.03.23.18.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 May 2012 23:18:14 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120504001239.GI9822@denix.org>
Date: Fri, 4 May 2012 08:18:12 +0200
Message-Id: <A6271593-0F2B-422C-9E2F-CC413CC39A97@dominion.thruhere.net>
References: <1335899212-29869-1-git-send-email-koen@dominion.thruhere.net>
	<20120503171556.GJ2681@denix.org>
	<9F436296-853B-4A02-97B4-77B491AD6D2B@dominion.thruhere.net>
	<20120504001239.GI9822@denix.org>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkVZMzvbxd5ZpuWw+GUXDB0oudlz4IyId3zscO1FDmTnUzza1S/n83eTzr2s2/hzcOG3lvC
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
X-List-Received-Date: Fri, 04 May 2012 06:18:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 4 mei 2012, om 02:12 heeft Denys Dmytriyenko het volgende geschreven:

> On Thu, May 03, 2012 at 07:20:47PM +0200, Koen Kooi wrote:
>>=20
>> Op 3 mei 2012, om 19:15 heeft Denys Dmytriyenko het volgende =
geschreven:
>>=20
>>> It's a heavy patch, but my question is - how is it different from =
linux-3.0 we=20
>>> already have, besides the version upgrade to 3.2? Why is it called=20=

>>> linux-mainline, the old linux recipe is also mainline with beagle =
patches.
>>>=20
>>> Basically, I'm trying to understand 2 things here:
>>> - what's the difference between this beagle patch set and the one =
applied on=20
>>> top of e.g. 3.0.28? Is it a different dev model, goals, owner or =
anything else
>>=20
>> Pretty much the same, with less PM. The goal is to keep moving closer =
to=20
>> mainline and to a recent mainline version. With this update we'll be =
using=20
>> the same kernel Robert Nelson uses for his ubuntu builds.
>=20
> Ok, the whole series is now in.

Crap, it was still RFC. I'll try to get the wifi and audio fixes done =
ASAP now.

>=20
>>> - why the name change with -mainline suffix?
>>=20
>> To namespace it like we planned for our u-boot recipes, a number of =
layers=20
>> have linux_3.2.bb recipes that would clash :( I'm not really fond of =
it, but=20
>> that's the price we pay for all these layers.
>=20
> Wouldn't linux-mainline_3.2.bb clash as well with another layer? I =
thought the=20
> agreement was to have TI-specific namespacing, such as SoC family in =
the=20
> name...

having the SoC name was just a side effect of using the tree-name =
(-psp-am335x, -denx, etc).=

