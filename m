Return-Path: <b.hutchman@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6E5B0E00406
	for <meta-ti@yoctoproject.org>; Sat, 10 Aug 2013 04:21:13 -0700 (PDT)
Received: by mail-ea0-f169.google.com with SMTP id z7so2555893eaf.28
	for <meta-ti@yoctoproject.org>; Sat, 10 Aug 2013 04:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=cHoU0LBbar/MIdLsysAAsQbRoeAqPrA4bx1vwTmGv6A=;
	b=H4ML+dMYjm0Yp08tZRoMZ51CgzJ/WUSTN7J5qdqT1rNSYE1RlTtrk/AQcxA0uHVZcu
	41vn3fM4GYl0NUDL7EBpcBNs9qKdhw/wDn4A5kvrxt63CRGq4Px/1l71mVJBDQWbFroQ
	kppaATBf8xTMoMWY5ryoStq9XskmPb36jUOymLXTWf9w5dCstc52dJT+seyPVHGyBOQ7
	sDgMjRFLvRv0qM0urIhxNRd7xgSs77yA/STlLUcfCdnGhbQYBB9f/X9BrUVxeOloWRKi
	wtonk8CSyERsxhG+I2UfaxfvT+STIiS4LdzHEZjiGLC6HodWrs+7c0q+yPI1YY803Gpb
	giYQ==
MIME-Version: 1.0
X-Received: by 10.15.31.9 with SMTP id x9mr17196774eeu.103.1376133672906; Sat,
	10 Aug 2013 04:21:12 -0700 (PDT)
Received: by 10.223.90.1 with HTTP; Sat, 10 Aug 2013 04:21:12 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1308100651500.3147@oneiric>
References: <alpine.DEB.2.02.1308091920590.10592@oneiric>
	<CAFZh4h8MZBVtwCUisoaNnBrd=Y81jZkrkhKAZUx2+JcBvTWepA@mail.gmail.com>
	<CAFZh4h9V7-06jGW2Sz4ksKRFEBabDchiY2aMdMeriF6NGPxJ8g@mail.gmail.com>
	<alpine.DEB.2.02.1308100611110.2277@oneiric>
	<CAFZh4h-w1MnoXZ-u5592OLDMUADmACSYZb4edncWEprjQ8qHcg@mail.gmail.com>
	<alpine.DEB.2.02.1308100651500.3147@oneiric>
Date: Sat, 10 Aug 2013 07:21:12 -0400
Message-ID: <CAFZh4h88M0R9dC6-t4F5dgZPFEOJx2dEk_pQxQhpWC-B3R1ubg@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: should mesa_9.1.5.bbappend be upgraded to 9.1.6?
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
X-List-Received-Date: Sat, 10 Aug 2013 11:21:15 -0000
Content-Type: multipart/alternative; boundary=089e0168127cbcddae04e396163c

--089e0168127cbcddae04e396163c
Content-Type: text/plain; charset=ISO-8859-1

>
> .
>
>   anyway, as i said, masking out recipes-graphics was a stopgap
> measure, but i'd rather do this the "right" way, if someone wants to
> explain what the "right" way is.
>
> rday
>

I don't know.  I first renamed mesa_9.1.5.bbappend to messa_9.1.6.bbappend
and that worked to continue my build but like I said I ran into other
issues ... if you look back a few days you can see where I posted about
that.  What worked for me was a clean checkout of the branches.  YMMV I
guess :)

Regards,

Brian

--089e0168127cbcddae04e396163c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">.<br>
<br>
=A0 anyway, as i said, masking out recipes-graphics was a stopgap<br>
measure, but i&#39;d rather do this the &quot;right&quot; way, if someone w=
ants to<br>
explain what the &quot;right&quot; way is.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
rday<br></div></div></blockquote><div><br></div><div>I don&#39;t know. =A0I=
 first renamed=A0<span style=3D"background-color:rgb(255,255,255);color:rgb=
(34,34,34);font-family:arial,sans-serif;font-size:13px">mesa_9.1.5.bbappend=
 to messa_9.1.6.bbappend and that worked to continue my build but like I sa=
id I ran into other issues ... if you look back a few days you can see wher=
e I posted about that. =A0What worked for me was a clean checkout of the br=
anches. =A0YMMV I guess :)</span></div>
<div><br></div><div>Regards,</div><div><br></div><div>Brian</div><div>=A0</=
div><div><br></div><div>=A0</div></div>

--089e0168127cbcddae04e396163c--
