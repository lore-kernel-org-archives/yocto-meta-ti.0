Return-Path: <agnel.joel@gmail.com>
Received: from mail-bw0-f48.google.com (mail-bw0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3D372E006B4
	for <meta-ti@yoctoproject.org>; Wed, 19 Oct 2011 23:26:55 -0700 (PDT)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by bkar19 with SMTP id r19so4491471bka.35
	for <meta-ti@yoctoproject.org>; Wed, 19 Oct 2011 23:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=nJrlfr9d+pLHlTq/Y3mqYU7ZR0j+9NOu55n/y4+oMeQ=;
	b=N7XaBZeUDAk5tEtRpcZ8tezs4pV6v/r1XYMAtJkkbdgOxVGCziqg4CZ57ZxyfaDtoh
	l7/1et5tj1w7iJSHJts23ivY/uPjc8W4/gyCGo/MBi3VQ2sLWHTehpXu3pRi8f775FEL
	hL8ws4IJewVqusDH9WJSgcy0QNb67In5s/FZ4=
MIME-Version: 1.0
Received: by 10.223.5.3 with SMTP id 3mr16278688fat.4.1319092013629; Wed, 19
	Oct 2011 23:26:53 -0700 (PDT)
Received: by 10.152.12.136 with HTTP; Wed, 19 Oct 2011 23:26:53 -0700 (PDT)
In-Reply-To: <a42934277b1d4c0c82a5a63ba7988309@DLEE74.ent.ti.com>
References: <1319075659-3888-1-git-send-email-joelagnel@ti.com>
	<a42934277b1d4c0c82a5a63ba7988309@DLEE74.ent.ti.com>
Date: Thu, 20 Oct 2011 01:26:53 -0500
Message-ID: <CAD=GYpaE4b5TGM2JT4-B+jUEDV4id-f-amv6cef88XKc_7+Axg@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, "Fernandes,
	Joel A" <joelagnel@ti.com>, "Kridner, Jason" <jdk@ti.com>
Subject: Re: [Angstrom-devel] [PATCH v2 meta-ti] linux-ti33x-psp 3.1rc8: Add pin mux and init for beaglebone specific devices
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
X-List-Received-Date: Thu, 20 Oct 2011 06:26:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2011 at 12:38 AM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
> [added meta-ti list]
>
>
> Op 20 okt. 2011, om 03:54 heeft Joel A Fernandes het volgende geschreven:
>
>> Currently added for following:
>> =A0* User LEDs (added by Koen Kooi <k-kooi@ti.com>)
>> =A0* BeagleBone tester
>>
>> Build and run time tested.
>>
>> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
>> ---
>> v2 changes:
>> Replaced correct patch
>
> I don't like this, at all. Please do your changes as a seperate patch, no=
t as a change to an existing patch. And if you =A0update a patch in the fut=
ure please use -B -C to git format-patch so it can detect the rename and pr=
oduce a real diff instead of a add+delete pair.
>

O.K.

Thanks,
Joel

