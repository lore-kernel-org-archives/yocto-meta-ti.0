Return-Path: <koen@beagleboard.org>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7CEAAE0044A
	for <meta-ti@yoctoproject.org>; Mon, 21 May 2012 22:48:49 -0700 (PDT)
Received: by eekb45 with SMTP id b45so1669751eek.35
	for <meta-ti@yoctoproject.org>; Mon, 21 May 2012 22:48:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=d611zWe/AJhTUs7UC+09okCMNNLR3zZct7GDt2/toQQ=;
	b=KjyCVdhkfLNRb1Xi6e2goD3T/rKFSgiVjPybU7QLGVhi4eVDflkPoY340rQPbrfKAM
	zp7hlf32B3flxoa27rl2ebSEyoKpbJsWl+7dghZstZSAOBRtHKPJKmH9Gqlt5qI/yX2I
	zifzskj8LPpRqeNY5hNP6Boy+r6kHDc2sAIkI9JypqX0me0IlbD/2gnOWedJxGTMmb+Z
	eeRoYMOYMvOzF7QVPnYMochqyrfg2JHUpMTHiScQoMLC0yAzZ4pCTTIIYM8JrYg46t4c
	Mz/G/ALeXg8OTyUH9xjLSZHrQWI0xbqZqipj2NkKk5qPh2bRVJThLleqCpxaz5tVeq5V
	aDGg==
Received: by 10.213.3.197 with SMTP id 5mr4874696ebo.39.1337665728017;
	Mon, 21 May 2012 22:48:48 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id a16sm101114721eeg.0.2012.05.21.22.48.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 May 2012 22:48:47 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@beagleboard.org>
In-Reply-To: <52E11F40-B7EF-41BA-B462-662DDE01C311@dominion.thruhere.net>
Date: Tue, 22 May 2012 07:48:44 +0200
Message-Id: <9FB288D3-4180-4AFB-9374-95A5CC27A54E@beagleboard.org>
References: <1337645555-1805-1-git-send-email-schnitzeltony@googlemail.com>
	<52E11F40-B7EF-41BA-B462-662DDE01C311@dominion.thruhere.net>
To: =?iso-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQmf4VlGtlxx4nCshf2vYrZ4TEyqwb1jqxuZ+crItZFFGBidnwE+2s+136VRso87HqckUxZD
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] linux-mainline: Add patches to enable libertas firmware loading asynchronously
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
X-List-Received-Date: Tue, 22 May 2012 05:48:49 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 22 mei 2012, om 07:43 heeft Koen Kooi het volgende geschreven:

>=20
> Op 22 mei 2012, om 02:12 heeft Andreas M=FCller het volgende =
geschreven:
>=20
>> When using udev >=3D177 libertas driver does not load properly the =
firmware [1].
>> The patches 0001-0016 were taken from [2] and can be viewed at [3]. =
Patch 0017
>> I created to fix compiler complaining for missing symbol is_interrupt =
when
>> DEBUG set.
>> The patch series was tested with meta-gumstix on overo with udev-175 =
and
>> udev-182.
>>=20
>> [1] http://www.spinics.net/lists/linux-wireless/msg85541.html
>> [2] =
git://git.kernel.org/pub/scm/linux/kernel/git/linville/wireless-next.git
>> [3] =
http://git.kernel.org/?p=3Dlinux/kernel/git/linville/wireless-next.git;a=3D=
history;f=3Ddrivers/net/wireless/libertas;hb=3DHEAD
>>=20
>> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
>=20
> Could you please add the patches to the 'upstream' of this recipe =
instead? https://github.com/beagleboard/kernel/tree/beagleboard-3.2

s/instead/as well/ of course. Time for coffee :)=

