Return-Path: <jfabernathy@gmail.com>
Received: from mail-qw0-f48.google.com (mail-qw0-f48.google.com
	[209.85.216.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5D2D3E004D2
	for <meta-ti@yoctoproject.org>; Wed,  8 Feb 2012 14:51:08 -0800 (PST)
Received: by qauh8 with SMTP id h8so834156qau.14
	for <meta-ti@yoctoproject.org>; Wed, 08 Feb 2012 14:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=vt5MRFJYZIAWWRDbKj0NndRIk3I9ItdFM4Yxd6F215M=;
	b=XFf218keJ8F4Zqi/HdFdhox8Oh7NhzRqfavy8yQkG5mnny+4EkX8G5OeoTMezFunU/
	WJpIn5U3SO/pqLVriHZFnTHbgeN3OzIiJ2ma+mZMZvS+kWvoV2maekwkXISGZf0W1c05
	4YDkOFezbh+aDiAr0Z5h+mUH8M2BwW3N/Bh00=
Received: by 10.224.188.66 with SMTP id cz2mr394010qab.23.1328741467768;
	Wed, 08 Feb 2012 14:51:07 -0800 (PST)
Received: from [10.0.1.26] (nc-184-3-54-63.dhcp.embarqhsd.net. [184.3.54.63])
	by mx.google.com with ESMTPS id
	fi8sm1547972qab.21.2012.02.08.14.51.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 08 Feb 2012 14:51:07 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: James Abernathy <jfabernathy@gmail.com>
In-Reply-To: <4F32F87E.2070907@mlbassoc.com>
Date: Wed, 8 Feb 2012 17:51:35 -0500
Message-Id: <38997C75-E36D-4A49-96D0-FB5E8A52817D@gmail.com>
References: <4F32F016.4020008@gmail.com> <4F32F1B3.8090000@mlbassoc.com>
	<4F32F31B.2000303@gmail.com>
	<59EDC5ED-F339-48E8-8C4D-7137C23927CD@dominion.thruhere.net>
	<4F32F59B.7010804@mlbassoc.com>
	<8EA0B5D5-4DC5-4F48-83E6-B019862BD57F@dominion.thruhere.net>
	<4F32F87E.2070907@mlbassoc.com>
To: Gary Thomas <gary@mlbassoc.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: building Yocto for Pandaboard
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
X-List-Received-Date: Wed, 08 Feb 2012 22:51:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Feb 8, 2012, at 5:34 PM, Gary Thomas wrote:

> On 2012-02-08 15:27, Koen Kooi wrote:
>>=20
>> Op 8 feb. 2012, om 23:22 heeft Gary Thomas het volgende geschreven:
>>=20
>>> On 2012-02-08 15:18, Koen Kooi wrote:
>>>>=20
>>>> Op 8 feb. 2012, om 23:11 heeft jfabernathy het volgende geschreven:
>>>>=20
>>>>> On 02/08/2012 05:05 PM, Gary Thomas wrote:
>>>>>> On 2012-02-08 14:58, jfabernathy wrote:
>>>>>>> I'm trying to build the pandaboard BSP for Yocto. I cloned the =
meta-ti repository in the poky directory and tried to build =
core-image-sato for both machine pandaboard and
>>>>>>> omap4430-panda. However, I immediately get an error because =
bitbake is looking for recipes-images/angstrom/systemd-image.bb, which =
is required in the ti-hw-bringup-image.bb image
>>>>>>> recipe.
>>>>>>>=20
>>>>>>> All I really included was the machine name change in local.conf =
and added the meta-ti layer in bblayers.conf.
>>>>>>>=20
>>>>>>> Did I miss a step?
>>>>>>=20
>>>>>> This was discussed last week.  Add this line to your local.conf
>>>>>>  BBMASK =3D ".*/meta-ti/recipes-misc/"
>>>>>> This will skip some BeagleBoard/BeagleBone recipes that are not
>>>>>> currently working in a Yocto tree.
>>>>>>=20
>>>>> Thanks a bunch. That got it going.  The README said nothing
>>>>=20
>>>> Stop spreading such lies!
>>>=20
>>> It's not a lie, just a perspective.
>>=20
>> It *is* a lie, since the README is non-empty. Regardless of what you =
want to do, the README does contain content.
>=20
> Sorry, I thought you were referring to my work-around to get this
> going in Yocto.  Obviously, he was looking for more info in the
> README than just how to use this layer with Angstrom and I agree
> that this "trick" probably does not belong in the README.
>=20
> --=20

Wow!  Sorry I jumped into a mailing list I obviously don't understand or =
belong in.  I apologize if I offended.  I did read the README, but it =
didn't make a bit of sense to me because it talked about angstrom, which =
I don't know anything about and wondered what that had to do with yocto. =
 My current Yocto knowledge is based on the meta-intel layer, which =
doesn't mention angstrom.  It sounds like the hint/trick that Gary =
mentioned will make bitbake build with just yocto, which is what I want. =
 My goal is more of a proof of concept.  I'd like to prove if you could =
take the same image recipe and move it from Pandaboard to Atom and vice =
versa.  That way a developer could pick the hardware platform based on =
the performance, features, and cost.  The software effort should be =
minimal to move if the Yocto concept works as advertised.

Jim A
=20
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


