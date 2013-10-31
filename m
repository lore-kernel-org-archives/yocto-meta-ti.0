Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 36C4AE017BD
	for <meta-ti@yoctoproject.org>; Wed, 30 Oct 2013 20:57:03 -0700 (PDT)
Received: by mail-ie0-f172.google.com with SMTP id tp5so4025407ieb.17
	for <meta-ti@yoctoproject.org>; Wed, 30 Oct 2013 20:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=ydMCXj4XhfLlMho9LdCgsdBtse1iGS9iM+lHP3BS+UI=;
	b=cJFM4+saAG+g8rgrJacmKCoVM2G2ZSSZnARRdwUJutLQUEucAv/L2yl9LOIbzGnIfO
	QpJIKvp5qD+Jp4fxaX70GQKRy632PEHe+/hGBOd0mNFrnC7bE6bwiMlXHLfB8AJQSTNv
	7D+4+O8wnMYUZRJNzGgnydhNfPwLr37tYJnPerGGoWQl4pcmJN09d9keWsYx0mg0ZpHH
	NGBLF2gubgreVVBTpELsOfeg/i7wj4Ld/alq2lholpfOpSLsgY48wmKan30v0/WzVik8
	1WG/eI127In/MIB+TQRrTgF73CEjKqOLSncTpv4mB6fZ2OE2/hgurGkbdHyImBHQIKRD
	HfkQ==
X-Received: by 10.43.143.76 with SMTP id jl12mr50590icc.82.1383191822632; Wed,
	30 Oct 2013 20:57:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.219.195 with HTTP; Wed, 30 Oct 2013 20:56:31 -0700 (PDT)
In-Reply-To: <B0581B5571079145BA1CD78C126DBDE72E906A57@DLEE08.ent.ti.com>
References: <1382606978-9914-1-git-send-email-schnitzeltony@googlemail.com>
	<5269031E.4040504@mlbassoc.com>
	<CALbNGRQHT73Zg4u+4b7sg8AONfxy--hsXoPejz2sY8pthX-T_Q@mail.gmail.com>
	<B0581B5571079145BA1CD78C126DBDE72E906A57@DLEE08.ent.ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Oct 2013 20:56:31 -0700
Message-ID: <CAMKF1srTwEHJqGRmxXRY0M=yXYGxUFV5qE4TXbn88LVsdadB6A@mail.gmail.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] mesa appends: remove PROVIDES
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
X-List-Received-Date: Thu, 31 Oct 2013 03:57:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

ping. I am also waiting on this patch or similar getting in into meta-ti

On Thu, Oct 24, 2013 at 5:14 AM, Dmytriyenko, Denys <denys@ti.com> wrote:
> Thanks, I'll have to look at it once I'm back from ELCE...
>
>
> Denys
>
>
>
> -----Original Message-----
> From: Andreas M=C3=BCller [schnitzeltony@googlemail.com]
> Received: Thursday, 24 Oct 2013, 12:49
> To: Gary Thomas [gary@mlbassoc.com]
> CC: meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]
> Subject: Re: [meta-ti] [PATCH] mesa appends: remove PROVIDES
>
> On Thu, Oct 24, 2013 at 1:23 PM, Gary Thomas <gary@mlbassoc.com> wrote:
>> On 2013-10-24 03:29, Andreas M=C3=BCller wrote:
>>>
>>> These came in when mesa was reworked. Nowadays they are useless and wha=
t
>>> they try to do achieve is wrong: provider for virtual/libgsl should be
>>> mesa-gl. The appends were left in to avoid backward revision trouble in
>>> package feeds.
>>
>>
>> If this is the correct solution, I think these .bbappend files should be
>> removed completely.  They don't change anything and keeping them just to
>> retain the PRINC is useless because as is one cannot even build a system
>> which uses virtual/mesa, e.g. one using the X11 server.  In addition, th=
e
>> main mesa recipe is about to be updated so they'll need changing again
>> very
>> soon.
>>
> So let's kick them out as soon as mesa is updated
>
> Andreas
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>

