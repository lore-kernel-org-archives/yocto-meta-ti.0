Return-Path: <pabigot@gmail.com>
Received: from mail-wy0-f176.google.com (mail-wy0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A8E7DE006B8
	for <meta-ti@yoctoproject.org>; Mon, 14 Nov 2011 07:32:18 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by wyg10 with SMTP id 10so1260410wyg.35
	for <meta-ti@yoctoproject.org>; Mon, 14 Nov 2011 07:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=7fiZClv0itzVaPEYQOsUlt0zuRvNFtPcH0V2nXNnkeo=;
	b=CRwAn83i7FegLjyxw6GX5es+NuZT9+OAc27XtdcuqqgICiOY96TZZLT/sSjgmocFAO
	zAstmq9hw8/C/7J06+n+ZZuLDQ2tn4KApBHFFWOQdZs2zd0gcqZTfRpDYxdO1c37DiRM
	kkW+tHibdJLrya+QQvXxFovv1+5vWGafgeM+0=
MIME-Version: 1.0
Received: by 10.227.205.132 with SMTP id fq4mr15363309wbb.5.1321284737526;
	Mon, 14 Nov 2011 07:32:17 -0800 (PST)
Sender: pabigot@gmail.com
Received: by 10.216.30.200 with HTTP; Mon, 14 Nov 2011 07:32:17 -0800 (PST)
In-Reply-To: <DE33B98D-0A5F-4042-B821-DD8496B9AE59@dominion.thruhere.net>
References: <1321208655-9701-1-git-send-email-bigotp@acm.org>
	<1321208716-9749-1-git-send-email-bigotp@acm.org>
	<489EAC51-52A8-48BC-92F8-6905B9E94589@dominion.thruhere.net>
	<CAPOJ94OE+ALWZkov_w73bh4v2C85X-0MHg+RZDxFhOURqDsAYQ@mail.gmail.com>
	<DE33B98D-0A5F-4042-B821-DD8496B9AE59@dominion.thruhere.net>
Date: Mon, 14 Nov 2011 09:32:17 -0600
X-Google-Sender-Auth: 0qEZ7RWJAcOkaqKLXpKcxuJlCbA
Message-ID: <CAPOJ94OKxPJKWy7eNxzMc-HXYJzpMh7pzKSjqotq38FcqWMTNA@mail.gmail.com>
From: Peter Bigot <bigotp@acm.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/2] sdcard_image bbclass: fix MLO copy, loop device mounts, fstypes
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
X-List-Received-Date: Mon, 14 Nov 2011 15:32:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 14, 2011 at 9:07 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>
> Op 14 nov. 2011, om 15:57 heeft Peter Bigot het volgende geschreven:
>
>> On Sun, Nov 13, 2011 at 12:42 PM, Koen Kooi <koen@dominion.thruhere.net>=
 wrote:
>>>
>>> Op 13 nov. 2011, om 19:25 heeft Peter A. Bigot het volgende geschreven:
>>>
>>>> From: "Peter A. Bigot" <bigotp@acm.org>
>>>>
>>>> Generalize the search for MLO to install to have correct path for copi=
es
>>>> placed in ${DEPLOY_DIR_IMAGE} by x-load.inc, and to continue for SPL b=
uilds
>>>> where there is no MLO.
>>>>
>>>> Allow user to override the loop mount point as well as the loop device=
, for
>>>> folks who don't want long paths to temporary directories in their fsta=
bs.
>>>>
>>>> Add noauto to example fstab entries so systems will boot without attem=
pting
>>>> to mount an unconfigured loopback device.
>>>>
>>>> Remove IMAGE_FSTYPE_append which does not belong in this class.
>>>
>>> I like the fstab changes, but not the others, could you please split th=
is patch?
>>
>> So I can prepare more appropriate patches now and in the future, please =
explain:
>>
>> * Why do you want to hard-code the MLO symlink paths in the install
>> and deploy directories instead of using the bitbake variables that
>> x-load.inc uses for those paths?
>
> Due to variable scoping those are only available inside those recipes, no=
t the image class.

Yes, but they're default-assigned, so an override in local.conf would
apply to both, no?  Why does x-load allow them to be overridden?
Maybe that'd be a clue as to the right way to change the point-of-use.

What's the point of adding a nomachine symlink anyway?  A desire to
avoid specifying the target filename in the cp command?  Consistently
using MLO-${MACHINE} for the source and MLO for the target would be a
lot more clear, since the target absolutely must be named "MLO".

meta-ti now has two things that can create an MLO file (x-load and
u-boot) and a third thing that uses it (sdcard_image), and they're
inconsistent in how they name it.  Ick.

>> * Why do you want IMAGE_FSTYPE to be extended with .tar.bz2 when this
>> class has nothing to do with tar.bz2 images?
>
> It used the tar.bz2 rootfs to populate the extX partition in the past, bu=
t it looks like it can go away now.
>
>> * Why do you want IMAGE_FSTYPE to be set in the class when every other
>> image recipe in openembedded puts IMAGE_FSTYPE modifications in the
>> recipe that incorporates the image?
>
> That was a hack to make inheriting the class "just work". I'm not sure ho=
w to proceed on this one, do we merge this into image_types.bbclass in OE-c=
ore or not? If there's enough support for requiring to both inherit the cla=
ss and to set IMAGE_FSTYPES to sdcard we can move it.

As far as I can tell, that (both inherit and set) is exactly how it's
done normally.

Personally I'd like to see a lot of cleanup in sdcard_class before it
got merged to oe-core image_types.  Among other things, the ability to
create the images for the partitions independently, and only
optionally combine multiple partitions into a whole-disk image.  Most
of the time I'll have a pre-formatted sd card and only want to update
the rootfs partition.

Besides, a generic name like "sdimg" almost certainly shouldn't be a
class that only knows how to build boot partitions for OMAP boards
that require MLO.

Peter

>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
>
> iEYEARECAAYFAk7BLsYACgkQMkyGM64RGpHYhQCfbQcmAJJCZvCyLeoHU4JlTl6e
> YOEAn298tyHdEDA+IAk/Zi979pn1nv/g
> =3DCvBb
> -----END PGP SIGNATURE-----
>
>

