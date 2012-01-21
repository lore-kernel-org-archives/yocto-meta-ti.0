Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f42.google.com (mail-ww0-f42.google.com [74.125.82.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E4A3FE004D2
	for <meta-ti@yoctoproject.org>; Fri, 20 Jan 2012 23:34:30 -0800 (PST)
Received: by wgbgn7 with SMTP id gn7so97608wgb.5
	for <meta-ti@yoctoproject.org>; Fri, 20 Jan 2012 23:34:29 -0800 (PST)
Received: by 10.180.104.198 with SMTP id gg6mr695319wib.4.1327131269354;
	Fri, 20 Jan 2012 23:34:29 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id di5sm17194088wib.3.2012.01.20.23.34.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Jan 2012 23:34:28 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <201201210003.10081.schnitzeltony@gmx.de>
Date: Sat, 21 Jan 2012 08:34:25 +0100
Message-Id: <54EBC8C3-C012-4C02-9A82-61598E92D74C@dominion.thruhere.net>
References: <1327063792-2685-1-git-send-email-koen@dominion.thruhere.net>
	<CA+M6bXkSKimGzpL+-W4JQ5095SiwJx7iukM8y-X8+icZjbPLHw@mail.gmail.com>
	<201201210003.10081.schnitzeltony@gmx.de>
To: =?iso-8859-1?Q?Andreas_M=FCller?= <Schnitzeltony@gmx.de>
X-Mailer: Apple Mail (2.1251.1)
X-Gm-Message-State: ALoCoQnquj9wn7U6wR3+3kgJapegAcLrJy20Xpa25L68RHUuFS0HzW4kjDV+92OJBHJg3AvtElXN
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] u-boot 2011.12: fix L2 cache on non-omap4 platforms
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
X-List-Received-Date: Sat, 21 Jan 2012 07:34:31 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 21 jan. 2012, om 00:03 heeft Andreas M=FCller het volgende =
geschreven:

> On Friday, January 20, 2012 04:40:43 PM Tom Rini wrote:
>> On Fri, Jan 20, 2012 at 5:49 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>>=20
>> Acked-by: Tom Rini <trini@ti.com>
>>=20
>> And to address Andreas' comment, for now the proper solution is still
>> under discussion so an isolated revert is fine here.
> I know - but the commit message of original patch said:
>=20
> | This was breaking the boot for OMAP4 with latest mainline
> | kernel. The solution is to disable external caches in
> | cleanup_before_linux(). With this fix kernel is booting again.
>=20
> Just wanted to avoid issues on OMAP4 because my feeling is that =
discussions on=20
> this issue will last a while so that this patch will be more than a =
temporary=20
> workaround and I do not see what's wrong with some #ifdeffing here.

The ifdef is in the recipe itself:

+# Non-omap4 platforms need outer cache turned on
+CACHEFIX =3D =
"file://2011.12/0001-Revert-armv7-disable-L2-cache-in-cleanup_before_linu.=
patch"
+CACHEFIX_omap4 =3D ""=

