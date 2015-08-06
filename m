Return-Path: <ankur.tyagi85@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7686EE00A7D; Wed,  5 Aug 2015 20:49:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.214.179 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (ankur.tyagi85[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 70699E00A53
	for <meta-ti@yoctoproject.org>; Wed,  5 Aug 2015 20:49:30 -0700 (PDT)
Received: by obnw1 with SMTP id w1so46817676obn.3
	for <meta-ti@yoctoproject.org>; Wed, 05 Aug 2015 20:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=nL4AlSwc5kmcY2T+7mTPXyJTZ3KuU+4ULV2XkNHHV28=;
	b=G05hx22Siu4oWJ3/4aYWwXQ8Bv0YKHV2yQJJE+XK/kjuqhYuyTJDWc0eSaFskqfnMl
	3OscbyghTePLzAzEXdxWYLC1bXvvlEiURtydOJ6rpMzMrZeDvHWT3xY5HnlUTlMFrP4d
	BqH8fkJN5VNm/lIKZoi/RFugY1FrZ9NXsoIuKEIV6LJnRdBRNNP2K7stqJvobzD5azfl
	qE9bEOXiQAjBItI/zfHhHjpPmXm/ANWKxGmXxQC9yo+lt82+b5EjP2ZvA0liyWqAESwT
	ekY+vCtlZW5EqzTGzEm1+ovHMvKPZY5EdOIn1yT+5PD4u78hVDz3ZNVhT3dlc0nokfEO
	wIjg==
X-Received: by 10.182.104.38 with SMTP id gb6mr11158486obb.24.1438832970072;
	Wed, 05 Aug 2015 20:49:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.86.131 with HTTP; Wed, 5 Aug 2015 20:49:10 -0700 (PDT)
In-Reply-To: <CAMKF1sr1n=k9ZHAT5N-7_DXPn2XguyOGqq8wJKO0qEmEQW9-=A@mail.gmail.com>
References: <CADySD0F4suq9YcgUy8HqzH6cYs1j4RZtmwfNTSvWTd+f872LKA@mail.gmail.com>
	<CAMKF1soasoTP6wYhC8WDEuBn05ROkCKd_AcaoYGWgM+dEWE_Uw@mail.gmail.com>
	<CADySD0HWA-06wXF34Nh2==K_HCuAMViaFaD1HLGiacMocghqig@mail.gmail.com>
	<CAMKF1sr1n=k9ZHAT5N-7_DXPn2XguyOGqq8wJKO0qEmEQW9-=A@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 6 Aug 2015 15:49:10 +1200
Message-ID: <CADySD0FTkzQc5j98buY587OFr2qC7_8LTNgdUM=bhuyP6KqP=A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: omap3-sgx-modules-5.01.01.xx ONLY supports hardfp mode for now
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
X-List-Received-Date: Thu, 06 Aug 2015 03:49:33 -0000
Content-Type: multipart/alternative; boundary=089e0122e6ba128ade051c9c6886

--089e0122e6ba128ade051c9c6886
Content-Type: text/plain; charset=UTF-8

thanks for help.

Will try with above suggestion

"Knowledge is knowing tomato is a fruit, wisdom is not putting it in a
fruit salad"

On Thu, Aug 6, 2015 at 3:46 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, Aug 5, 2015 at 8:41 PM, Ankur Tyagi <ankur.tyagi85@gmail.com>
> wrote:
> > Thanks for your response.
> >
> > So it is worth trying with TUNE_FEATURE "hfp" and measure the
> performance.
> > Do I have to set TARGET_FPU as "hfp-neon" as default value is "vfp-neon"
> >
>
> all you might need is to select a proper DEFAULTTUNE in machine config
> something like
>
> DEFAULTTUNE ?= "cortexa8thf-neon"
>
> > Does it make sense to push this change upstream as well ?
> >
> > "Knowledge is knowing tomato is a fruit, wisdom is not putting it in a
> fruit
> > salad"
> >
> > On Thu, Aug 6, 2015 at 3:00 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> On Wed, Aug 5, 2015 at 7:47 PM, Ankur Tyagi <ankur.tyagi85@gmail.com>
> >> wrote:
> >> > Hi,
> >> >
> >> > I am using TI AM335x-EVM kit and while building image using
> >> > "arago-daisy-config.txt", I saw this warning :
> >> >
> >> > omap3-sgx-modules-5.01.01.02 ONLY supports hardfp mode for now
> >> > omap3-sgx-modules-5.01.01.01 ONLY supports hardfp mode for now
> >> >
> >> > and TUNE_FEATUREis "vfp"
> >> >
> >> > Does that mean GPU is not getting used anymore ?
> >>
> >> not really, what its telling is that you dont have
> >> callconvention-hard in TUNE_FEATURES
> >> which means that compiler wont use hardfloat ABI when making function
> >> calls.
> >> but neon/vfp will still be used e.g. when doing vectorization etc. if
> >> using hardfp ABI will radically improve performance totally depends
> >> upon kind of workload that you are measuring. It may vary.
> >>
> >> > I am using QT5 with eglfs platform and need GPU support for
> performance.
> >> >
> >> > Please clarify the situation.
> >> >
> >> > Thanks
> >> > Ankur
> >> >
> >> > --
> >> > _______________________________________________
> >> > meta-ti mailing list
> >> > meta-ti@yoctoproject.org
> >> > https://lists.yoctoproject.org/listinfo/meta-ti
> >> >
> >
> >
>

--089e0122e6ba128ade051c9c6886
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:georgia,=
serif;font-size:small;color:#333399">thanks for help.</div><div class=3D"gm=
ail_default" style=3D"font-family:georgia,serif;font-size:small;color:#3333=
99"><br></div><div class=3D"gmail_default" style=3D"font-family:georgia,ser=
if;font-size:small;color:#333399">Will try with above suggestion</div></div=
><div class=3D"gmail_extra"><br clear=3D"all"><div><div class=3D"gmail_sign=
ature"><div dir=3D"ltr">&quot;Knowledge is knowing tomato is a fruit, wisdo=
m is not putting it in a fruit salad&quot;</div></div></div>
<br><div class=3D"gmail_quote">On Thu, Aug 6, 2015 at 3:46 PM, Khem Raj <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">=
raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<span class=3D"">On Wed, Aug 5, 2015 at 8:41 PM, Ankur Tyagi &lt;<a href=3D=
"mailto:ankur.tyagi85@gmail.com">ankur.tyagi85@gmail.com</a>&gt; wrote:<br>
&gt; Thanks for your response.<br>
&gt;<br>
&gt; So it is worth trying with TUNE_FEATURE &quot;hfp&quot; and measure th=
e performance.<br>
&gt; Do I have to set TARGET_FPU as &quot;hfp-neon&quot; as default value i=
s &quot;vfp-neon&quot;<br>
&gt;<br>
<br>
</span>all you might need is to select a proper DEFAULTTUNE in machine conf=
ig<br>
something like<br>
<br>
DEFAULTTUNE ?=3D &quot;cortexa8thf-neon&quot;<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; Does it make sense to push this change upstream as well ?<br>
&gt;<br>
&gt; &quot;Knowledge is knowing tomato is a fruit, wisdom is not putting it=
 in a fruit<br>
&gt; salad&quot;<br>
&gt;<br>
&gt; On Thu, Aug 6, 2015 at 3:00 PM, Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Wed, Aug 5, 2015 at 7:47 PM, Ankur Tyagi &lt;<a href=3D"mailto:=
ankur.tyagi85@gmail.com">ankur.tyagi85@gmail.com</a>&gt;<br>
&gt;&gt; wrote:<br>
&gt;&gt; &gt; Hi,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I am using TI AM335x-EVM kit and while building image using<b=
r>
&gt;&gt; &gt; &quot;arago-daisy-config.txt&quot;, I saw this warning :<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; omap3-sgx-modules-5.01.01.02 ONLY supports hardfp mode for no=
w<br>
&gt;&gt; &gt; omap3-sgx-modules-5.01.01.01 ONLY supports hardfp mode for no=
w<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; and TUNE_FEATUREis &quot;vfp&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Does that mean GPU is not getting used anymore ?<br>
&gt;&gt;<br>
&gt;&gt; not really, what its telling is that you dont have<br>
&gt;&gt; callconvention-hard in TUNE_FEATURES<br>
&gt;&gt; which means that compiler wont use hardfloat ABI when making funct=
ion<br>
&gt;&gt; calls.<br>
&gt;&gt; but neon/vfp will still be used e.g. when doing vectorization etc.=
 if<br>
&gt;&gt; using hardfp ABI will radically improve performance totally depend=
s<br>
&gt;&gt; upon kind of workload that you are measuring. It may vary.<br>
&gt;&gt;<br>
&gt;&gt; &gt; I am using QT5 with eglfs platform and need GPU support for p=
erformance.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Please clarify the situation.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Thanks<br>
&gt;&gt; &gt; Ankur<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; _______________________________________________<br>
&gt;&gt; &gt; meta-ti mailing list<br>
&gt;&gt; &gt; <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproj=
ect.org</a><br>
&gt;&gt; &gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" r=
el=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo=
/meta-ti</a><br>
&gt;&gt; &gt;<br>
&gt;<br>
&gt;<br>
</div></div></blockquote></div><br></div>

--089e0122e6ba128ade051c9c6886--
