Return-Path: <b.hutchman@gmail.com>
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 32C66E01422
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2013 14:33:56 -0700 (PDT)
Received: by mail-ob0-f175.google.com with SMTP id xn12so1345927obc.6
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2013 14:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=+QZZHQvPSkplS/yWyAubBNP/QsN2S5JRcf2zLmJqeTQ=;
	b=PRxN+6Ku+p2LSnH5FSDJEz5NZqkD85REGnU6/zT3QnOwGXKMTvzmknLHcdjEyNaKi0
	jUlOypN5Y6DMqN8yndc2RgXxjncIn76lRJ+wIIfYT0sD8WnKq5D2BNIYbHv4EFjn6yCM
	r5kmBdraaNBVLQyZEtmbJ+mror4E4Ce/rLjzSwZgM2SqPg0pdXgPck5uKtgojgPi42aN
	YcDVo9ObS0eFMlQNpahlsDbpI7SfpFdEBf8u4qWVP2jAEHDj1DBtYxtuNkUu5YWjuqnp
	QQahE+BWTBYj/7ysEDTwWRLQBnSydsGPkdSfzpos2M/yGRPvz1mivy7vv/Ex2oCWLaWP
	58uw==
MIME-Version: 1.0
X-Received: by 10.60.56.3 with SMTP id w3mr16153701oep.37.1376602436251; Thu,
	15 Aug 2013 14:33:56 -0700 (PDT)
Received: by 10.60.142.41 with HTTP; Thu, 15 Aug 2013 14:33:56 -0700 (PDT)
In-Reply-To: <CAFZh4h92PbtVfz3q0nknoRNe3nHaGGNurOa-T0HSGzRinvHCsA@mail.gmail.com>
References: <CAFZh4h_683cetV7QjyVgBcsJ9Seooy5wiE8R-fU9L+sqJanU4g@mail.gmail.com>
	<CAFZh4h92PbtVfz3q0nknoRNe3nHaGGNurOa-T0HSGzRinvHCsA@mail.gmail.com>
Date: Thu, 15 Aug 2013 17:33:56 -0400
Message-ID: <CAFZh4h9CVYZCwomJc-Fw9Q_6mF1ybmJdG0Or9rvzsHGNLTLJJg@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Stumped. Can't get 2.6.37 TI kernel to boot when built with toolchain from denzil or Linaro gcc-linaro-arm-linux-gnueabihf-4.8-2013.07-1_linux/
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
X-List-Received-Date: Thu, 15 Aug 2013 21:33:57 -0000
Content-Type: multipart/alternative; boundary=001a11c20a7235b3fa04e4033bbc

--001a11c20a7235b3fa04e4033bbc
Content-Type: text/plain; charset=ISO-8859-1

... more evidence at least one other poor soul is having the same problem:

http://comments.gmane.org/gmane.comp.handhelds.openembedded/52259

--001a11c20a7235b3fa04e4033bbc
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">... more evidence at least one other poor soul is having t=
he same problem:<div><br></div><div><a href=3D"http://comments.gmane.org/gm=
ane.comp.handhelds.openembedded/52259">http://comments.gmane.org/gmane.comp=
.handhelds.openembedded/52259</a><br>
</div></div>

--001a11c20a7235b3fa04e4033bbc--
