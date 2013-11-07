Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f43.google.com (mail-pb0-f43.google.com
	[209.85.160.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E268DE01389
	for <meta-ti@yoctoproject.org>; Thu,  7 Nov 2013 09:15:43 -0800 (PST)
Received: by mail-pb0-f43.google.com with SMTP id md4so884192pbc.2
	for <meta-ti@yoctoproject.org>; Thu, 07 Nov 2013 09:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=t3mFXkvDbTUkFjQOOMWZDjbvx2ZWb8BHyRsHESJ2ktw=;
	b=E/Nr/uWk5cbmgNADZqREheaXf1zC7oIwBUr7AsESPjJBX2PK9yCwI8Xcp9ryCDOwko
	0SREZOdVXmsizIVA6aHg0ngtvVdDRxTZCRU24z0aq9Ap8EILmv6nFjn1Xe4ObzYVQs0O
	hCNF1XpbPViOuw/WhGbslYLx4I6DVccTlgr0NhEH19Xsi9ReD35byMXHuKNqEP6rtHMw
	+3Et7+cAgpWYkTHlHlwTkd2SZRTC/Nh3xwFYzZ+SeKzQ78uVPfXACh1tya4KILUtH+1S
	gQHq7hDM1ZHYUMh9sn7/Sp8xAeoSeiNYszmrB/e3l+7R0HJ5IYkX5tzs9ri+pMlMpbj+
	CDgg==
X-Received: by 10.68.254.132 with SMTP id ai4mr10123649pbd.51.1383844542878;
	Thu, 07 Nov 2013 09:15:42 -0800 (PST)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id
	nj9sm6331136pbc.13.2013.11.07.09.15.41 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 07 Nov 2013 09:15:42 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.0 \(1816\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20131107165950.GH4510@edge>
Date: Thu, 7 Nov 2013 09:15:40 -0800
Message-Id: <C8830048-B8B8-4303-90D6-3EB1EBE10E4C@gmail.com>
References: <1383791126-22557-1-git-send-email-raj.khem@gmail.com>
	<7D46E86EC0A8354091174257B2FED101597FE834@DLEE11.ent.ti.com>
	<CAMKF1spDWuAjV6Uf=XWBUUYM=f+C+nDzt_7iePjUfktTQ44OkA@mail.gmail.com>
	<20131107165950.GH4510@edge>
To: Denys Dmytriyenko <denys@ti.com>
X-Mailer: Apple Mail (2.1816)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
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
X-List-Received-Date: Thu, 07 Nov 2013 17:15:44 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


On Nov 7, 2013, at 8:59 AM, Denys Dmytriyenko <denys@ti.com> wrote:

> On Wed, Nov 06, 2013 at 08:55:55PM -0800, Khem Raj wrote:
>> On Wed, Nov 6, 2013 at 8:29 PM, Maupin, Chase <chase.maupin@ti.com> =
wrote:
>>> This seems like a reversal of =
http://arago-project.org/git/meta-ti.git?a=3Dcommit;h=3Ddabd83e96fe99d0c3d=
1a88be4d1637831526d217
>>>=20
>>> Looks like there may be a need to cover the different use cases and=20=

>>> understand what each person is trying to do :)
>>>=20
>>=20
>> ah I see what caused this all pain. So now meta-ti is odd ball out.
>> this patch should have never gone in.
>=20
> Khem,
>=20
> If you remember, we discussed this with Richard and he suggested this =
as a=20
> solution to the ordering problem. Otherwise people tend to append any =
extra=20
> layers _after_ oe-core, which should be the other way around in order =
to=20
> override anything in there=85

I think the problem is when you have many other layers then the whole =
paradigm changes to it
and you end up with same issue upside down. I think how you order =
bblayer.conf can control the override of
oe-core, I wish if distro=92s could control the layer.conf for each bsp =
layer then it wouldnt matter as much


>=20
> --=20
> Denys
>=20
>=20
>>>> -----Original Message-----
>>>> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>>>> bounces@yoctoproject.org] On Behalf Of Khem Raj
>>>> Sent: Thursday, November 07, 2013 7:55 AM
>>>> To: meta-ti@yoctoproject.org
>>>> Subject: [meta-ti] [PATCH] adjust BBPATH to be a good citizen of
>>>> layer world
>>>>=20
>>>> Currently, meta-ti appears as first path in BBPATH
>>>> rest of layers append so lets do the same
>>>>=20
>>>> helps distros with multiple BSP layers to include meta-ti
>>>>=20
>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> ---
>>>> conf/layer.conf | 2 +-
>>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>=20
>>>> diff --git a/conf/layer.conf b/conf/layer.conf
>>>> index e39bd85..faa4ac0 100644
>>>> --- a/conf/layer.conf
>>>> +++ b/conf/layer.conf
>>>> @@ -1,5 +1,5 @@
>>>> # We have a conf and classes directory, append to BBPATH
>>>> -BBPATH =3D. "${LAYERDIR}:"
>>>> +BBPATH .=3D ":${LAYERDIR}"
>>>>=20
>>>> # We have a recipes directory, add to BBFILES
>>>> BBFILES +=3D "${LAYERDIR}/recipes*/*/*.bb
>>>> ${LAYERDIR}/recipes*/*/*.bbappend"
>>>> --
>>>> 1.8.3.2
>>>>=20
>>>> _______________________________________________
>>>> meta-ti mailing list
>>>> meta-ti@yoctoproject.org
>>>> https://lists.yoctoproject.org/listinfo/meta-ti
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti


