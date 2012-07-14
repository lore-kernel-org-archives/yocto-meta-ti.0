Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CD72BE0027E
	for <meta-ti@yoctoproject.org>; Fri, 13 Jul 2012 23:32:15 -0700 (PDT)
Received: by wgbfa7 with SMTP id fa7so2955676wgb.28
	for <meta-ti@yoctoproject.org>; Fri, 13 Jul 2012 23:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=eWvcsmtmpPYOJE1SSZWVLL0uCclh9y5GoNHGxJYWEvg=;
	b=gZSPbXd2hFRHzOJQbX341Hz5I1mEZlcivF5xipPPIsFLiQhpB21HCRkf1zIko3/JvQ
	/VBDfong3KFCvAJI89jDES1bb7rFUfU+wwqjbGxZ/xQNQI7v52EQKDGv3sKyVjgI8r1v
	KfEK6N7MXyUdAKBH9xyKzwQvHhM+sSNxYWbCkZg7grYJ7qGdaXMi1/3P75trkR8NMixL
	nA05obX37aqp6cRzkch+AkL6GpAhQ0ZYrS/PVnBdpY0aI443a253gMuXQloP2MjMYxeu
	jrgwM07tzgjOchg6M4KZlumnWqDrHD8DU52gJFo4CIdlTGiucCnoiy1N6cz4lUD6/u0o
	viNA==
Received: by 10.180.83.234 with SMTP id t10mr4472423wiy.0.1342247534529;
	Fri, 13 Jul 2012 23:32:14 -0700 (PDT)
Received: from [10.47.217.41] ([188.207.89.201])
	by mx.google.com with ESMTPS id fb20sm11419296wid.1.2012.07.13.23.32.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 23:32:12 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120713233018.GA24499@edge>
Date: Sat, 14 Jul 2012 08:32:09 +0200
Message-Id: <AAC1DFB5-A2AB-49F2-A802-7DBF124F4E08@dominion.thruhere.net>
References: <CADZ6=avGWT=-4vLVs3VOW6dx1kmuo_qyP7jdkQiroM-UXZi06A@mail.gmail.com>
	<20120713233018.GA24499@edge>
To: Denys Dmytriyenko <denys@ti.com>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQnMBuKe7cv+KXw3CBCiZ/AYYW/jnIMX+Y2katDkCw9qj9K28XD4oVu7skm6pZJ0xDKRGIj1
Cc: meta-ti@yoctoproject.org
Subject: Re: netbase-4.47 vs. -5.0 build breakage
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
X-List-Received-Date: Sat, 14 Jul 2012 06:32:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 14 jul. 2012, om 01:30 heeft Denys Dmytriyenko het volgende =
geschreven:

> On Fri, Jul 13, 2012 at 04:47:22PM +0200, Thilo Fromm wrote:
>> Hi guys,
>>=20
>> is anything happening to fix the current build breakage against
>> oe-core? oe-core moved on to netbase-5.0, meta-texasinstruments is
>> still referring to netbase-4.47 with a .bbappend. Andreas M??ller
>> submitted a patch on 9th of July which fixes this. Please apply the
>> patch; currently the meta-ti build is broken.
>=20
> Thilo,
>=20
> People do have vacations, you know, hence the 4-day delay. It is now =
in.

Now that master is broken with denzil, can we have a branch to track =
yocto 1.2/denzil please?=

