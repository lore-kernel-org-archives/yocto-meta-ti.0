Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f54.google.com (mail-ww0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CF4E9E0132F
	for <meta-ti@yoctoproject.org>; Tue,  6 Mar 2012 06:16:02 -0800 (PST)
Received: by wgbdq13 with SMTP id dq13so4230221wgb.11
	for <meta-ti@yoctoproject.org>; Tue, 06 Mar 2012 06:16:01 -0800 (PST)
Received: by 10.180.101.136 with SMTP id fg8mr18278086wib.4.1331043361682;
	Tue, 06 Mar 2012 06:16:01 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id 9sm79508055wid.2.2012.03.06.06.15.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Mar 2012 06:16:00 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F561A52.5090209@ti.com>
Date: Tue, 6 Mar 2012 15:15:54 +0100
Message-Id: <C7D4E657-552D-4810-8C32-2DCBAA0DB18C@dominion.thruhere.net>
References: <20120306005241.GF2030@denix.org> <4F561A52.5090209@ti.com>
To: William Mills <wmills@ti.com>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnoic5e2iUanIlrOeDiFKDj4Obvey8BlTd8qkWSw3AAvAhfZWhD9i0tMwNkLbEZfr5kUtSS
Cc: meta-ti@yoctoproject.org
Subject: Re: OpenEmbbedded as a test suite next steps
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
X-List-Received-Date: Tue, 06 Mar 2012 14:16:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 6 mrt. 2012, om 15:08 heeft William Mills het volgende geschreven:

>=20
> On 03/05/2012 07:52 PM, Denys Dmytriyenko wrote:
>> All,
>>=20
>> Early planning stages of what's going to be a meta-linaro toolchain =
layer for
>> OE-Core/Yocto. Interesting stuff, we should probably pitch in for =
some of the
>> items there, that we can help with - such as selection of the =
platforms with
>> recent kernels and possibly cloud builds... Any thoughts?
>>=20
>=20
> Yes, absolutely, I do indeed concur wholeheartedly!
>=20
> I was about to suggest that for kernel they just target the qemu arm =
machine.  Does oe-core treat that as armv7?

armv5te, which is a good thing, since the world isn't made of cortex-A8s =
:)

regards,

Koen=

