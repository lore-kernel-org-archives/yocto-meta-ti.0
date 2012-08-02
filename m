Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B3D68E002A9
	for <meta-ti@yoctoproject.org>; Thu,  2 Aug 2012 08:07:41 -0700 (PDT)
Received: by eaab14 with SMTP id b14so2386038eaa.35
	for <meta-ti@yoctoproject.org>; Thu, 02 Aug 2012 08:07:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=ydr302uMLUBD6Hpe38jKZ930482P/q2BCcFQNSIsorA=;
	b=eRNtStuIrYzYQ+4VVjua4sVjle8pYPsk/fObmi6R4oBj8xpmtlHwCEnMlZGYIo5Sof
	vYhVIpKaCIFCNCX2mFFMoDNE7iwdPaqbbx3kOHR/rRMmeqE3QAuMX7rKUODlfmZa54M5
	imCu8uv8JEwKVMQ9NJ28FHiCUV8cjLPSxdlVa1phMYTvVZ+dBJj5PTF7dxOaOmqYgJOQ
	y/4yvBmJZQ/mkKwcFLmQvvIymgiLwreaBQzkh8lfX5cgswXqeNZooDfnm7ggJZxQ61sA
	YDSsqCdkFrtwIWUXlY1jcpTc/0tlVGJQxyVzmx3llvE5zSHV63zGeWstnKzP885fu6gq
	4MLQ==
Received: by 10.14.218.5 with SMTP id j5mr21684410eep.16.1343920060350;
	Thu, 02 Aug 2012 08:07:40 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id t6sm18153606eeo.17.2012.08.02.08.07.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Aug 2012 08:07:39 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <7D46E86EC0A8354091174257B2FED10159175366@DLEE12.ent.ti.com>
Date: Thu, 2 Aug 2012 17:07:36 +0200
Message-Id: <307F2CD6-B16B-4EC7-A670-06361B199D00@dominion.thruhere.net>
References: <8F29D6B095ED194EA1980491A5E029710C27E75F@DFLE30.ent.ti.com>
	<102FAACD-FA2C-45CD-B8E8-E1BF93554183@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED10159175366@DLEE12.ent.ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQlv6UbWVdDZbjtUtqD52DVzzXNYTT6+TCM6mg+dlf/V6TPfMepj6JXvpCxaGwnk4LMpSpNd
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, "Cooper Jr.,
	Franklin" <fcooper@ti.com>
Subject: Re: [branch: master][PATCHES] Porting netbase interfaces file from oe-classic
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
X-List-Received-Date: Thu, 02 Aug 2012 15:07:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 2 aug. 2012, om 16:53 heeft "Maupin, Chase" <chase.maupin@ti.com> het =
volgende geschreven:

>> -----Original Message-----
>> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>> bounces@yoctoproject.org] On Behalf Of Koen Kooi
>> Sent: Wednesday, August 01, 2012 10:59 PM
>> To: Cooper Jr., Franklin
>> Cc: meta-ti@yoctoproject.org
>> Subject: Re: [meta-ti] [branch: master][PATCHES] Porting netbase
>> interfaces file from oe-classic
>>=20
>> Please send patches inline to make review easier.
>>=20
>> Patch 1:
>>=20
>>> * Add PR_append
>>=20
>> Don't do that, that's what PRINC is for
>>=20
>>> * Pull in the base interface file from oe-core
>>=20
>> Completely unneeded
>=20
> I actually prefer that the first commit move in the base file he
> is modifying and then have the second commit make his changes.
> It is much easier to understand what change he was making to the
> base file and why he needing to overlay it.

My point is that you're now *globally* modifying basefiles for *all* =
machines, including non-TI ones as soon as you have meta-ti in the layer =
stack, which is unacceptable. If you really want a catch-all interfaces =
file, put it in meta-arago.=

