Return-Path: <b.hutchman@gmail.com>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1FD33E01422
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2013 14:48:01 -0700 (PDT)
Received: by mail-ob0-f171.google.com with SMTP id tb18so1410283obb.30
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2013 14:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=OgUc+ZjkDyT4mbn/nJgTssajEYbX58+MHktnluHJWcI=;
	b=tA2Kn/lLqXG8Olr3eNjqZzrUntkbX/mR4HZlV7kFZuTLHYHCQ6DFvgbnQHvKxI4Dw3
	jPuBgslumP4URaaEiK+Yzk488xTlraTT/VxrtKLfNA0NMhM8HU0JZYjwsSUdkUusA7/5
	mDR51ZOG5dsHzUpQRq/uThF52sHJTjZAhBETfY9ByfyA4Qyr3rX2AMQPJU7Pi4/HaOIP
	tw7IgK/dUumvZn1PB8bCRVRyAfaZH9iW7ZzpJ1D1tDGMsrw1JMuoVfvOnM7+mjQmnjoR
	y2FpPo9m/ijY9QQOCRlBhRCJdKcoBNisD7wuXNnSd7VXB0XKOvmaOR+0RWxztAQJ4/Nq
	omTw==
MIME-Version: 1.0
X-Received: by 10.182.51.228 with SMTP id n4mr2018059obo.70.1376603280919;
	Thu, 15 Aug 2013 14:48:00 -0700 (PDT)
Received: by 10.60.142.41 with HTTP; Thu, 15 Aug 2013 14:48:00 -0700 (PDT)
In-Reply-To: <CAMKF1srWwdOs+d5EWFSYbup3hvUmBxXH+wf04msajpcVpYDiAA@mail.gmail.com>
References: <CAFZh4h_683cetV7QjyVgBcsJ9Seooy5wiE8R-fU9L+sqJanU4g@mail.gmail.com>
	<CAFZh4h92PbtVfz3q0nknoRNe3nHaGGNurOa-T0HSGzRinvHCsA@mail.gmail.com>
	<CAMKF1srWwdOs+d5EWFSYbup3hvUmBxXH+wf04msajpcVpYDiAA@mail.gmail.com>
Date: Thu, 15 Aug 2013 17:48:00 -0400
Message-ID: <CAFZh4h8nUmERufB+0ADCorwrZ0trb_oh7ZmADE_2-O7GTDxC9g@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
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
X-List-Received-Date: Thu, 15 Aug 2013 21:48:03 -0000
Content-Type: multipart/alternative; boundary=089e0158b6568e53ba04e4036d9f

--089e0158b6568e53ba04e4036d9f
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 15, 2013 at 5:32 PM, Khem Raj <raj.khem@gmail.com> wrote:

>
>
>
> On Thu, Aug 15, 2013 at 2:14 PM, Brian Hutchinson <b.hutchman@gmail.com>wrote:
>
>> Update.  Well, adding Sakoman's patch to head.S and compiling with -mno-unaligned-access
>> didn't appear to help so far ... :(
>>
>>
> If its gcc 4.8+ then you also need more patches see my fixes for beagle
> e.g.
>
>
> https://github.com/beagleboard/meta-beagleboard/commit/87efc663c4f76d3051cecf1e2c3e2bbd461d200b
> 
>
>
After I apply these patches, should I still be passing EXTRA_CFLAGS=
-mno-unaligned-access
to make uImage?

Regards,

Brian

--089e0158b6568e53ba04e4036d9f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Thu, Aug 15, 2013 at 5:32 PM, Khem Raj <span dir=3D"ltr=
">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmai=
l.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gma=
il_quote">
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div dir=3D"ltr"><div style=3D"font-family:&#39;courier ne=
w&#39;,monospace;font-size:small">
<br></div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote"><di=
v class=3D"im">On Thu, Aug 15, 2013 at 2:14 PM, Brian Hutchinson <span dir=
=3D"ltr">&lt;<a href=3D"mailto:b.hutchman@gmail.com" target=3D"_blank">b.hu=
tchman@gmail.com</a>&gt;</span> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div dir=3D"ltr">Update. =A0Well, adding Sakoman&#39;s pat=
ch to head.S and compiling with=A0<span style=3D"white-space:pre-wrap">-mno=
-unaligned-access didn&#39;t appear to help so far ... :(</span><div>


<span style=3D"white-space:pre-wrap"><br></span></div></div></blockquote><d=
iv><br></div></div><div><div>If its gcc 4.8+ then you also need more patche=
s see my fixes for beagle e.g.</div>

<div><br></div><div><a href=3D"https://github.com/beagleboard/meta-beaglebo=
ard/commit/87efc663c4f76d3051cecf1e2c3e2bbd461d200b" target=3D"_blank">http=
s://github.com/beagleboard/meta-beagleboard/commit/87efc663c4f76d3051cecf1e=
2c3e2bbd461d200b</a></div>


</div><div><br></div></div></div></div></blockquote><div><br></div><div>Aft=
er I apply these patches, should I still be passing EXTRA_CFLAGS=3D=A0<span=
 style=3D"color:rgb(0,0,0);white-space:pre-wrap">-mno-unaligned-access to m=
ake uImage?</span></div>
<div><span style=3D"color:rgb(0,0,0);white-space:pre-wrap"><br></span></div=
><div><span style=3D"color:rgb(0,0,0);white-space:pre-wrap">Regards,</span>=
</div><div><span style=3D"color:rgb(0,0,0);white-space:pre-wrap"><br></span=
></div>
<div><span style=3D"color:rgb(0,0,0);white-space:pre-wrap">Brian</span></di=
v></div></div></div>

--089e0158b6568e53ba04e4036d9f--
