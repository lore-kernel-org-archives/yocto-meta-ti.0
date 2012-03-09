Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f42.google.com (mail-ww0-f42.google.com [74.125.82.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E47E8E0030B
	for <meta-ti@yoctoproject.org>; Thu,  8 Mar 2012 22:20:29 -0800 (PST)
Received: by wgbds11 with SMTP id ds11so406151wgb.5
	for <meta-ti@yoctoproject.org>; Thu, 08 Mar 2012 22:20:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=B8tl0t7MWyfRFZirSesGq46ctmoH9guVdUqmBWoExH0=;
	b=oodAb8/Ut871f+NqnRmp9Lpu1SoSZzMDD1rvg0usjARPrI9PEU7SoJVuqtxqihSetF
	zdu9h8d+6P6uE91vTcWIXFWv7adXQRlXq1kly65uWQbjiQxBQzjQM71+YOp3DfpKhx9t
	y7gp+Lu+NnVqq0dMgmASQs/PUaEtvXCw1SzQYpb8745ZbbiTh/tfa3nQ+Q4rXQyihWip
	mtiR8SFwnhL/yA4M1xTUtwmKTqYwKHCqxKVTBlv+EZGzhndY3i/SlPztaKoIDUb64BQy
	dvM4ustAeBGaUR8zXG7VBTXUyWGSz3ED8oWsksOVwdgS16GZaZl9bu3pWP6fcIoeRlAT
	4p/g==
Received: by 10.216.134.205 with SMTP id s55mr619971wei.100.1331274028824;
	Thu, 08 Mar 2012 22:20:28 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id df3sm2494838wib.1.2012.03.08.22.20.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 08 Mar 2012 22:20:27 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120308210125.GE10587@denix.org>
Date: Fri, 9 Mar 2012 07:20:30 +0100
Message-Id: <EEF3E563-5B95-4864-ACB7-85101641A086@dominion.thruhere.net>
References: <1331235244-5173-1-git-send-email-trini@ti.com>
	<20120308210125.GE10587@denix.org>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkKBS90CyzixIMyLXZxf4aeWS7BQynv/d46w/rjxMAtQ6GZAzDLJhj9Sg9oYdBFQAi/dfTM
Cc: Tom Rini <trini@ti.com>, meta-ti@yoctoproject.org
Subject: Re: [PATCH 0/4] IMAGE_FSTYPES fixes / improvements
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
X-List-Received-Date: Fri, 09 Mar 2012 06:20:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 8 mrt. 2012, om 22:01 heeft Denys Dmytriyenko het volgende =
geschreven:

> On Thu, Mar 08, 2012 at 12:34:00PM -0700, Tom Rini wrote:
>> Hey all,
>>=20
>> This short series does two things.  For 3 machines we fix a bug of =
using
>> '?=3D' rather than '+=3D' for setting IMAGE_FSTYPES (these are all of =
the
>> machines that have this issue today except for...) and on the 4th,
>> am335x-evm we add UBI support as well.  On the first three, these are
>> correct by inspection and on the fourth, I've written to and mounted
>> systemd-image from NAND on my EVM (it didn't work as I was using a =
custom
>> uImage that's not systemd-sane, and fixing that and confirming the =
config
>> used here works is on my list).
>=20
> All,
>=20
> Tom and I started talking on IRC and then decided to move the =
discussion back=20
> to the mailing list for others to participate.
>=20
> So, basically, the proposal is to do this in our machine.conf files:
>=20
> -IMAGE_FSTYPES ?=3D "jffs2 tar.bz2"
> +IMAGE_FSTYPES +=3D "jffs2 tar.bz2"
>=20
> My response was that we shouldn't do that.

+=3D is the OE classic way of doing things and is IMNSHO the right =
thing.

> The conf files that may set, append=20
> or overwrite IMAGE_FSTYPES are parsed in the order of local.conf, =
machine.conf=20
> and distro.conf. And if none of those set IMAGE_FSTYPES, bitbake.conf =
defaults=20
> to a sane tar.gz. =46rom end-user perspective, they expect the setting =
in their=20
> local.conf to be obeyed. If they don't care and don't set =
IMAGE_FSTYPES, then=20
> machine.conf will set it to supported values, i.e. jffs2 and tar.bz2 =
in our=20
> case. Of course, distro has the last word and potentially can alter =
it, but in=20
> most cases it shouldn't. That's how it works now and I believe it's =
the=20
> correct behaviour. Changing it to append additional values to what =
user wants=20
> is slightly heavy-handed, in my opinion. In other words, those are =
suggested=20
> image types, not enforced ones.
>=20
> As Tom poined out, this is the same behaviour as currently used in =
OE-Core,=20
> where qemu machines all have IMAGE_FSTYPES ?=3D "tar.bz2 ext3".
>=20
> The original issue in question may be coming from the way some setup =
scripts=20
> pre-configure user settings in local.conf, defaulting IMAGE_FSTYPES to=20=

> something, that is not very suitable for the machines being used. This =
needs=20
> to be left unset and for the end-user to decide and set specifically, =
IMHO.
>=20
> Comments, opinions?

See the discussion on OE-core a while back. There was a lot of =
handwaving done and suggested that IMAGE_FSTYPES_append_$machine =3D " =
foo" in local.conf is the right way to do this. I think it's not =
intuitive because you have to remember that +=3D and _append are =
expanded in different points during parsing, which requires either deep =
bitbake knowledge or minor braindamage.

regards,

Koen=

