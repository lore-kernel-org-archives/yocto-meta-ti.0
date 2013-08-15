Return-Path: <b.hutchman@gmail.com>
Received: from mail-oa0-f54.google.com (mail-oa0-f54.google.com
	[209.85.219.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 674FBE01440
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2013 12:26:56 -0700 (PDT)
Received: by mail-oa0-f54.google.com with SMTP id o6so1301029oag.41
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2013 12:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=TGfSzjUpeBlOp6SxL9N1RrFJ5kNVPzWLNU73EGL19U0=;
	b=FZ27ygQzGEjFQ7NaShki1fWtyQYUqHSnY7Og3OTbAGgBFz+KOFUMaH5EhZKPsruBJo
	l9zZ7ziSU6hvOdL+ctOmQDB8qZ+UWcY7AGHvUlgs09KObRLf+kliukf5vBMAaia5ewtd
	61668lbtYKooj58SvnZmZDCElF+cH0CjQNAgkHZUbYB5IW3zXxP1fI6giGT0qkrqH96d
	UwaSRaJpHha/hSLE52Tt4fdSkfP+OiUPcAUACvoDazfYJJ5YJKr3ejpBWHUBR4GvtcJ6
	g5vCxP+PKr00Vc/A9LLwbGsu9zQv/ju84HgzdYyXfN2a5+p+vWE7u6vZqFN1lzWgHgfV
	YiNw==
MIME-Version: 1.0
X-Received: by 10.60.17.229 with SMTP id r5mr15685090oed.41.1376594815864;
	Thu, 15 Aug 2013 12:26:55 -0700 (PDT)
Received: by 10.60.142.41 with HTTP; Thu, 15 Aug 2013 12:26:55 -0700 (PDT)
In-Reply-To: <20130815190600.GF2190@edge>
References: <CAFZh4h_683cetV7QjyVgBcsJ9Seooy5wiE8R-fU9L+sqJanU4g@mail.gmail.com>
	<CABcZANkNbqisKRLHTGmRSs=mbR4VBg2TqfV+CJp54R3G2eNUng@mail.gmail.com>
	<20130815190600.GF2190@edge>
Date: Thu, 15 Aug 2013 15:26:55 -0400
Message-ID: <CAFZh4h9xR44AvSW91eg_ecH0kR=760e5v1MC97r4hsjaB09Htw@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	Chris Larson <clarson@kergoth.com>
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
X-List-Received-Date: Thu, 15 Aug 2013 19:26:57 -0000
Content-Type: multipart/alternative; boundary=089e012955eeffd8a604e40174d3

--089e012955eeffd8a604e40174d3
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 15, 2013 at 3:06 PM, Denys Dmytriyenko <denys@ti.com> wrote:

>
> Yes, it is often a PITA to get old kernels build ...
>

What do you mean "old kernels"  It is from a TI PSP released not that long
ago! Wink, wink.  I'd love to use a 3+ kernel, know where I can find one ;)

B

--089e012955eeffd8a604e40174d3
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Thu, Aug 15, 2013 at 3:06 PM, Denys Dmytriyenko <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.c=
om</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5"><br>
</div></div>Yes, it is often a PITA to get old kernels build ...<br></block=
quote><div><br></div><div>What do you mean &quot;old kernels&quot; =A0It is=
 from a TI PSP released not that long ago! Wink, wink. =A0I&#39;d love to u=
se a 3+ kernel, know where I can find one ;)</div>
<div><br></div><div>B</div><div>=A0</div></div></div></div>

--089e012955eeffd8a604e40174d3--
