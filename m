Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 89D96E00746
	for <meta-ti@yoctoproject.org>; Wed, 21 Mar 2012 23:30:59 -0700 (PDT)
Received: by wibhr14 with SMTP id hr14so311810wib.11
	for <meta-ti@yoctoproject.org>; Wed, 21 Mar 2012 23:30:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to:x-mailer:x-gm-message-state:content-type
	:content-transfer-encoding;
	bh=m/LI1rT6BNqYAVVHZeuADlsVKYP0iyaBjfb3ev2dfTQ=;
	b=mUZldGzUZdlWCC3zrQsGATaYJGQl0hSmE0/G3JupqV40exWzo1o8UQzicFWRkRy47P
	FXcVMHYpTya/y33drMY79nZ7lVQOXtvQlgA/7OpaVnm14MwGMsKia44HucPtgQKRmME3
	+PcUUPOBPr0iX4xupSdewZ5ZPYJY7oFLf5MlLNcKsvznkFFm1wB3ynFjRKNuZd0nwmgE
	gBVuelmQAIrjm4OEzNDkeCAoVvpZP8GLO8VGoKkBhOjQ5CBsU4zjQpxiYXC7YBpg8m62
	M6T/51tM4uFkGRlrZg1EIRf30aUWQ6LfeseKugaORhnL8MdjwfNx7uKLXQXnlKC+zka1
	TaRg==
Received: by 10.180.100.196 with SMTP id fa4mr3094334wib.0.1332397857915;
	Wed, 21 Mar 2012 23:30:57 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id e6sm2711970wix.8.2012.03.21.23.30.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Mar 2012 23:30:56 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1332367838.9740.208.camel@ted>
Date: Thu, 22 Mar 2012 07:31:00 +0100
Message-Id: <F83C8961-F16F-4D3F-AF57-8FF4414022F6@dominion.thruhere.net>
References: <CALKp9+Z+pk6GZR2UPwToxCLGsKw0FO-Jj4nOnXEocSfFWwZBzg@mail.gmail.com>
	<E4FB558B-EFEA-42DF-B108-2EBB6B9B405D@dominion.thruhere.net>
	<86ehsln0t7.fsf@coulee.tdb.com>
	<ECCB2891-32C1-451D-B469-7B0B632D8641@dominion.thruhere.net>
	<1332365246.9740.195.camel@ted> <20120321214515.GD6857@denix.org>
	<1332367838.9740.208.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnc88Tb+6e44e/n8ZJY8hSbh1k17EExV7syTuJXycFRSuSvFx6tuaegfEArRzMtbmarNsVG
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
X-List-Received-Date: Thu, 22 Mar 2012 06:31:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 mrt. 2012, om 23:10 heeft Richard Purdie het volgende geschreven:

> On Wed, 2012-03-21 at 17:45 -0400, Denys Dmytriyenko wrote:
>> That's not true. There are no hard dependencies on meta-angstrom any =
more. And=20
>> meta-oe is only needed to supply gcc-4.5 for now, until all the =
issues are=20
>> ironed out.
>>=20
>> I've been making numerous builds past few weeks with different =
combination of=20
>> layers and besides few bugs I need to fix for the distro-less =
configuration,=20
>> was quite successful getting meta-ti work with oe-core WITHOUT =
meta-angstrom!
>>=20
>> There are some systemd dependencies, but they are no longer hard =
ones. There=20
>> was discussion about moving beagle payload stuff off of meta-ti. But =
it should=20
>> no longer break things.
>=20
> I've been going by the information I see and the contents of the =
meta-ti
> README. Reading the above it looks like much progress is being made,
> things are changing and I really do appreciate that happening!
>=20
>>> The amount of confusion this is causing users is immense as we see =
from
>>> new users and experienced ones alike. Whilst I know people have =
nodded
>>> and agreed they're going to fix it, time goes on and we don't seem =
to
>>> make much progress.
>>>=20
>>> The biggest confusion factor out there at the moment is meta-ti, not
>>> poky and I'd like to ask politely for people to get their act =
together.
>>=20
>> See above, the work is being done. The first wave of people who =
complained=20
>> about those dependencies are now building their images. There are =
still=20
>> confused people, but we'll clear the message once all obstacles are =
resolved.
>=20
> Great, thanks!
>=20
>> Richard, Koen, please take your word-fight and name-calling offline! =
It's not=20
>> a proper place here. Thank you.
>=20
> Well said and I agree with you! :)
>=20
> The trouble is Koen keeps doing this and nobody in general replies. =
The
> lack of a reply can be seen as to condone what was said and its
> certainly leading to people getting more confused. I think a response
> was appropriate.
>=20
> I also do not mean to undermine the progress being made on meta-ti. I
> hadn't heard much for a while but it looks like things are moving
> forward and that is great to see.

And for the record, I have been the *only* one so far sending patches to =
break that dependency and I don't even work for TI anymore!

=
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=3D0d4418518a0=
5b8f47697aa69a18a832d90eb8d87
=
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=3D17600a532e5=
74ec9e09a18a9cb6197b73331c3df
=
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=3De31722adc42=
ef202ae273571ce19a7ac304e5eb6

regards,

Koen=

