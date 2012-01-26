Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1CC84E00596
	for <meta-ti@lists.yoctoproject.org>;
	Thu, 26 Jan 2012 10:12:20 -0800 (PST)
Received: by werb10 with SMTP id b10so703225wer.26
	for <meta-ti@lists.yoctoproject.org>;
	Thu, 26 Jan 2012 10:12:19 -0800 (PST)
Received: by 10.216.52.198 with SMTP id e48mr1596494wec.18.1327601539629;
	Thu, 26 Jan 2012 10:12:19 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id em13sm6728155wid.7.2012.01.26.10.12.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jan 2012 10:12:18 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CA+M6bXmFYnz62unD5Mq5-3cbTmk4rpuySETP7Kd134F_k+qXvw@mail.gmail.com>
Date: Thu, 26 Jan 2012 19:12:11 +0100
Message-Id: <F17AE0E2-A005-4000-A122-3C7BA4393875@dominion.thruhere.net>
References: <1327599532-31609-1-git-send-email-koen@dominion.thruhere.net>
	<CA+M6bXmFYnz62unD5Mq5-3cbTmk4rpuySETP7Kd134F_k+qXvw@mail.gmail.com>
To: Tom Rini <tom.rini@gmail.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH] linux-ti33x-psp 3.1: add dto patch to fix problems with various sd cards
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
X-List-Received-Date: Thu, 26 Jan 2012 18:12:21 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 26 jan. 2012, om 19:01 heeft Tom Rini het volgende geschreven:

> On Thu, Jan 26, 2012 at 10:38 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>=20
> I know the patch isn't yours but should we perhaps go in and make the
> patch more obvious?  The function we're patching does a lot of
> guesswork to find 'dto' and then we just say 'use the max'.  Why not
> also go rip out that logic?

I was having the same conversation with Philip Balister on IRC just now =
:) It seems that this patch is being used by various TI customers to =
magically fix things so we do need to come up with a proper solution.

regards,

Koen=

