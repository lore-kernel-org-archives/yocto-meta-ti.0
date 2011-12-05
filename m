Return-Path: <tom.rini@gmail.com>
Received: from mail-qy0-f176.google.com (mail-qy0-f176.google.com
	[209.85.216.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 96261E00747
	for <meta-ti@yoctoproject.org>; Mon,  5 Dec 2011 12:00:13 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by qcsc2 with SMTP id c2so2090880qcs.35
	for <meta-ti@yoctoproject.org>; Mon, 05 Dec 2011 12:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=1jeiav/fzO7moXolI8i98Z9NZVpo4TQSh28R2EdiqRM=;
	b=xAz9x+dWd6RGe9HCs7wY0YaM0I8HkWxLLtROtRT8e06VbPvbcyJDqhOVwS12I0Rs98
	M3YKoIUKgGQ9F9l1roKg5VDwUlun1Zs9BVhCyRrOEdGJgla5RSsSpFUOt7nTKXN53Ps3
	RdudFYhJWCCyBShffxkec0WCcZxICoGG0QQIQ=
MIME-Version: 1.0
Received: by 10.224.180.131 with SMTP id bu3mr9280728qab.5.1323115212895; Mon,
	05 Dec 2011 12:00:12 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Mon, 5 Dec 2011 12:00:12 -0800 (PST)
In-Reply-To: <4EDD17D2.4000502@ti.com>
References: <cover.1322570446.git.otavio@ossystems.com.br>
	<ee2873ddeae5a79375823882a15da057536e2574.1322570446.git.otavio@ossystems.com.br>
	<CAP9ODKrAZudP6NLcuMk1-Sx7xphW-9Q_CrD0osj94th+_outkg@mail.gmail.com>
	<4EC9DF51-D28A-440F-889F-CC9EDCEA2530@dominion.thruhere.net>
	<4ED4DEF2.2000705@ti.com>
	<CAP9ODKrpdQoT-1v75X21p0E4rujj_Sg8wR3QDXW6kgPHWJEjgw@mail.gmail.com>
	<F00F7FDA-EEA8-47BD-AE07-52A4EFA8C078@dominion.thruhere.net>
	<4E93189F-8970-4235-AC37-4712652FD449@dominion.thruhere.net>
	<CAP9ODKpFT7sYS7scbVE1_EY+Qx5F9QcuV0jXCHfq5Kvk+qpjvg@mail.gmail.com>
	<CDEAD2BF-A97E-4CB4-AC24-C1C79C37B75D@dominion.thruhere.net>
	<4EDD17D2.4000502@ti.com>
Date: Mon, 5 Dec 2011 13:00:12 -0700
Message-ID: <CA+M6bXmSvNVydPf685a_A7SKpW7pOTHtMHD71_PRe6nZ1a8-aA@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: William Mills <wmills@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2 1/3] sdcard_image: rewrote to avoid using loopback and mount/unmount
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
X-List-Received-Date: Mon, 05 Dec 2011 20:00:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 5, 2011 at 12:13 PM, William Mills <wmills@ti.com> wrote:
> On 12/05/2011 06:30 AM, Koen Kooi wrote:
>>
>>
>> Op 29 nov. 2011, om 18:51 heeft Otavio Salvador het volgende geschreven:
>>
>>> On Tue, Nov 29, 2011 at 15:48, Koen Kooi<koen@dominion.thruhere.net>
>>> =A0wrote:
>>> mkfs.vfat keeps segfaulting at different points, I'll try to find out
>>> why.
>>>
>>> It works fine here.
>>>
>>> Maybe a change in your layer?
>>
>>
>> I did some more tests (MACHINE=3Dbeaglebone bitbake cloud9-image) and wi=
th
>> your patches mkfs.vfat segfaults, without the patches it works. I don't =
know
>> why that is.
>> I do want to get rid of the loopdevices, so if other people on this list
>> can test these patches as well...
>>
>
> Do you guys know if a similar method will be available for non-extN
> file-systems? =A0btrfs is the most likely case to come up first.
>
> If the answer is no, could we keep both methods and just default to the
> no-loop method?

It all depends on which filesystem.  For btrfs, 30sec of googling says
we could probably chain btrfs-convert to turn a genext2fs'd image into
btrfs.  Or get someone to write a utility that does this from scratch.

--=20
Tom

