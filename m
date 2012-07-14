Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7AD3DE0027E
	for <meta-ti@yoctoproject.org>; Sat, 14 Jul 2012 01:36:28 -0700 (PDT)
Received: by weyu3 with SMTP id u3so2711428wey.35
	for <meta-ti@yoctoproject.org>; Sat, 14 Jul 2012 01:36:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=sI/pptZijHQ+fPVDTcK16byaQ1StpAOQLGHONPQKEV0=;
	b=XE1GDsHXga202azHt63KnAiot2ut41VnYMMFUjB2iRZTlb6d9FpGKPlkE8yZdvEV40
	osWJptLIiXzGQGskc6N3RtEZtG/uHsU7NF+RTOWEQ07j64q8ly3LBtDT2sc/NnnDnGhu
	vfNWPkzN0YSN7R380wi+hE/Ry32BviQoUQTvlxgwDWCJ6wQDikjcEQQs7ppAswRUFlav
	beUC/qJxz7Yx1JuLUS1la7tZ2I7rVNWlLdqMkvn538Z9xnSpvCid4gfVgZ+H98s75Wzy
	N6yQ16CBGW/g1dDCFb3T+hkPQdl01o3dzirfP1eXyUlDSP6Ezd0iQwae9HJEU8/qjVF+
	P+6A==
Received: by 10.216.203.201 with SMTP id f51mr2248645weo.52.1342254987205;
	Sat, 14 Jul 2012 01:36:27 -0700 (PDT)
Received: from [10.47.217.41] ([188.207.89.201])
	by mx.google.com with ESMTPS id h9sm8084776wiz.1.2012.07.14.01.36.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 14 Jul 2012 01:36:25 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120714065015.GC24097@edge>
Date: Sat, 14 Jul 2012 10:36:21 +0200
Message-Id: <6A20A8A8-F910-47BB-966B-5F9F85AD7626@dominion.thruhere.net>
References: <CADZ6=avGWT=-4vLVs3VOW6dx1kmuo_qyP7jdkQiroM-UXZi06A@mail.gmail.com>
	<20120713233018.GA24499@edge>
	<AAC1DFB5-A2AB-49F2-A802-7DBF124F4E08@dominion.thruhere.net>
	<20120714065015.GC24097@edge>
To: Denys Dmytriyenko <denys@ti.com>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQmKa0FXMPdL2WfoLx74bowTlerbBUAshAWMJt20N+BKq2PD8RsWtFqc10NM09Lpv+K8X+78
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
X-List-Received-Date: Sat, 14 Jul 2012 08:36:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 14 jul. 2012, om 08:50 heeft Denys Dmytriyenko het volgende =
geschreven:

> On Sat, Jul 14, 2012 at 08:32:09AM +0200, Koen Kooi wrote:
>>=20
>> Op 14 jul. 2012, om 01:30 heeft Denys Dmytriyenko het volgende =
geschreven:
>>=20
>>> On Fri, Jul 13, 2012 at 04:47:22PM +0200, Thilo Fromm wrote:
>>>> Hi guys,
>>>>=20
>>>> is anything happening to fix the current build breakage against
>>>> oe-core? oe-core moved on to netbase-5.0, meta-texasinstruments is
>>>> still referring to netbase-4.47 with a .bbappend. Andreas M??ller
>>>> submitted a patch on 9th of July which fixes this. Please apply the
>>>> patch; currently the meta-ti build is broken.
>>>=20
>>> Thilo,
>>>=20
>>> People do have vacations, you know, hence the 4-day delay. It is now =
in.
>>=20
>> Now that master is broken with denzil, can we have a branch to track =
yocto=20
>> 1.2/denzil please?
>=20
> Yes, I was going to branch off of
> =
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tag/?id=3Dv2012.05-yocto=
1.2

I was thinking of using 30fb40ebc13614a74c2e237927c60ac43e01d1bc

That would save me from send a huge pull request :)

regards,

Koen=

