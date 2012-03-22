Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 603A6E013C9
	for <meta-ti@yoctoproject.org>; Thu, 22 Mar 2012 10:23:40 -0700 (PDT)
Received: by wibhr14 with SMTP id hr14so1010541wib.11
	for <meta-ti@yoctoproject.org>; Thu, 22 Mar 2012 10:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to:x-mailer:x-gm-message-state:content-type
	:content-transfer-encoding;
	bh=rxSJPR0euJt4VeGIrSSu1XA/InC1/PFb5jjOV9qMFLs=;
	b=Ep2FKRk4JalFtKpLUX0BxMybein9Qx5AdcZB/6MUPegbk2htrsLqpxPoQGPxBmqLkU
	ND3u3t/N1/zK+5jXvs4NqsGFVSChBomK2ZHLOF+WJBKqNDrJ4EzeHhD8HCHCW0ONi9X5
	N6MBkYnu/PhQLzF+YrBthPzhhpY7uuuSofkQWXwRiwpPsRV5he/+zGrc5IedTxTuL+zi
	P19UOvq6dRORr/3zd3DXJXjzuXD4XjSSZNH869jRDZyhpWNPx6KTd2nEBPBzg+66ZZKb
	jqji7AzvDuqzBuZhSkd7j0ZywqKVCaA/MCdug8IC4e+qWKFp00chtk3x3CMndxvr+zbV
	d0RQ==
Received: by 10.180.107.164 with SMTP id hd4mr6901715wib.18.1332437019885;
	Thu, 22 Mar 2012 10:23:39 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fw5sm6736362wib.0.2012.03.22.10.23.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 10:23:39 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F6B57CB.5080000@ti.com>
Date: Thu, 22 Mar 2012 18:23:37 +0100
Message-Id: <96D0E546-6404-4D90-ACC2-948675BC6C36@dominion.thruhere.net>
References: <CALKp9+Z+pk6GZR2UPwToxCLGsKw0FO-Jj4nOnXEocSfFWwZBzg@mail.gmail.com>	<E4FB558B-EFEA-42DF-B108-2EBB6B9B405D@dominion.thruhere.net>	<86ehsln0t7.fsf@coulee.tdb.com>	<ECCB2891-32C1-451D-B469-7B0B632D8641@dominion.thruhere.net>	<1332365246.9740.195.camel@ted>
	<20120321214515.GD6857@denix.org>	<1332367838.9740.208.camel@ted>	<F83C8961-F16F-4D3F-AF57-8FF4414022F6@dominion.thruhere.net>
	<20120322150716.GA13495@denix.org> <4F6B57CB.5080000@ti.com>
To: William Mills <wmills@ti.com>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmn8A9YvRnBe7KqCjvy14qX2ZJcyj0UIGDrSRWI6IMfR0qDMH0YFQGhWCFtudCsGuicW3iU
Cc: meta-ti@yoctoproject.org
Subject: Re: question on meta-ti for yocto
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
X-List-Received-Date: Thu, 22 Mar 2012 17:23:41 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Op 22 mrt. 2012, om 17:48 heeft William Mills het volgende geschreven:
> ---------------------------------
> [speaking for myself now]
>=20
> I fully support base poky testing but I think we are getting =
dangerously close to a defacto statement that the only real yocto based =
distro is one that _only_ uses poky + a BSP layer.  I am not aligned =
with that view.  I think oe-core and poky are a fine base but many =
customers will need to expand on what is there with more layers.

I have sent multiple emails to the oe-core/poky/yocto lists and bothered =
people in person about this, but the result is no answer at all (emails) =
or "Yes, we need to address the confusion" in person, but no action at =
all. I've found that the most successful way to get a clarifying =
statement is to be a giant troll and send flames like I did this week =
and in the past.

Specific example of getting no answer: =
https://lists.yoctoproject.org/pipermail/yocto/2012-March/007309.html

> Richard,
>=20
> You seem to take offense at Koen's claim that Angstrom is Yocto.  As I =
stated above I don't think Angstrom _is_ yocto but how do we refer to =
distributions that are based off of oe-core or even poky that include =
other layers.  Are they "Yocto based" or "Yocto aligned"?  How about =
"Yocto adjacent" :) ?

Yoctogenerian? And related to the email linked to above, what's the =
route to move a yoctogenerian distro under the yocto banner?

> Koen,
>=20
> The next time someone asks how to build "yocto" can you let Denys =
answer please :)

Sure, will do.

regards,

Koen=

