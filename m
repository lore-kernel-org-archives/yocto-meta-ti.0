Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ACF30E01389
	for <meta-ti@yoctoproject.org>; Thu,  7 Nov 2013 09:33:37 -0800 (PST)
Received: by mail-pa0-f52.google.com with SMTP id bj1so919431pad.39
	for <meta-ti@yoctoproject.org>; Thu, 07 Nov 2013 09:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=5Y8+Lipy8IlfMeRpaIzO1f9/jy8gjGCpli0XuywploE=;
	b=FGKqpTlBrmW4li3ip1dUOXefRoZxipRRprIrlueNSKwY2gM7aO/xh2pvjoqZFLwVh8
	nD7jwd2DItnWg1vDbnh5edTd8KOr7NQI2c1HkdxsPWty3IR1ziouQ6W9RwlUbqFk+bJH
	M1G9KiVfCI/u22qxpOxiGezFj/NYpYVF7Fy1H/AGL1XOpwWne9EXIkavEdPmbnngSJOd
	YT1VsCxb1HqQ8bwVp5EbIySBSvugGYY7n8hs4t6lqCZfYi5nlvXtzgl0H2E9jSA+KyeT
	5b4MgOu0G+J0114e0hxkybizL7SfDfJWCl4n0WqMrlIlkIJeP8PrPS9He6S8keWoOjw+
	6ZWQ==
X-Received: by 10.68.130.234 with SMTP id oh10mr10428282pbb.0.1383845616672;
	Thu, 07 Nov 2013 09:33:36 -0800 (PST)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id
	wd6sm7879498pab.3.2013.11.07.09.33.35 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 07 Nov 2013 09:33:35 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.0 \(1816\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20131107170108.GI4510@edge>
Date: Thu, 7 Nov 2013 09:33:33 -0800
Message-Id: <5D86A8BA-2F44-4EFE-8AA9-1FEB5E1C38B2@gmail.com>
References: <1383791126-22557-1-git-send-email-raj.khem@gmail.com>
	<20131107170108.GI4510@edge>
To: Denys Dmytriyenko <denys@ti.com>
X-Mailer: Apple Mail (2.1816)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] adjust BBPATH to be a good citizen of layer world
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Nov 2013 17:33:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Nov 7, 2013, at 9:01 AM, Denys Dmytriyenko <denys@ti.com> wrote:

> NAK for now, as there was a chance to comment on the proposed change:

well. I did not try, that change however its not that its set in stone =
either.
now meta-ti appears appears first no matter what in angstrom
in BBPATH and shadows meta-beagleboard which also provides definitions =
for beaglebone.conf
which I want to use and no matter what I try unless I start changing the =
other layers to prepend
as well I do not get the right order. I can happily punt out meta-ti or =
fork it but thats not the solution
I am looking for.



>=20
> http://thread.gmane.org/gmane.linux.embedded.yocto.meta-ti/2939
>=20
> On Wed, Nov 06, 2013 at 06:25:26PM -0800, Khem Raj wrote:
>> Currently, meta-ti appears as first path in BBPATH
>> rest of layers append so lets do the same
>>=20
>> helps distros with multiple BSP layers to include meta-ti
>>=20
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> conf/layer.conf | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/conf/layer.conf b/conf/layer.conf
>> index e39bd85..faa4ac0 100644
>> --- a/conf/layer.conf
>> +++ b/conf/layer.conf
>> @@ -1,5 +1,5 @@
>> # We have a conf and classes directory, append to BBPATH
>> -BBPATH =3D. "${LAYERDIR}:"
>> +BBPATH .=3D ":${LAYERDIR}"
>>=20
>> # We have a recipes directory, add to BBFILES
>> BBFILES +=3D "${LAYERDIR}/recipes*/*/*.bb =
${LAYERDIR}/recipes*/*/*.bbappend"
>> --=20
>> 1.8.3.2
>>=20
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti


