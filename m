Return-Path: <manuel.torres.fernandez@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0AAB2E00873; Fri, 26 Sep 2014 01:22:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (manuel.torres.fernandez[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.223.173 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4A4ACE007BA
	for <meta-ti@yoctoproject.org>; Fri, 26 Sep 2014 01:21:26 -0700 (PDT)
Received: by mail-ie0-f173.google.com with SMTP id tr6so15418384ieb.32
	for <meta-ti@yoctoproject.org>; Fri, 26 Sep 2014 01:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=bTaK3vplYARV6vLjc/Nz0QtZhWHyQrqHnB9+/wiKK6w=;
	b=iOYy8b8NcbPD0v2dICcCsdymRIxkfbrAAn4uQmbL8GvlVUFRIgVDm5DYwhOMauEGBC
	06RxzwPllBWTbMmg/0z9iI7mN+yhJciznoQ0wb9OVTMv2YT+AqByXZbo9Q3obeL2qmKn
	Fy8pMThsOHmqKfgh2AlvrVS6s9drVpJR3Pzm2PIkkQSC4AvlUztqcD07H+MraLXkpy0c
	bXP0MeGl8x+M0mEgNJ4QhqMxsXW1a7+HINVAbV3CjrB4fxOA5Pre3Aspf67hfbqG/CSx
	v0YEHqU4nOcYKGTkiExoXOs2Vga2UWruWvXjTeN7H2zoS6wqJUoJe34Yi/efpeABuh2c
	bWuA==
MIME-Version: 1.0
X-Received: by 10.50.50.175 with SMTP id d15mr26695218igo.35.1411719686011;
	Fri, 26 Sep 2014 01:21:26 -0700 (PDT)
Received: by 10.107.135.13 with HTTP; Fri, 26 Sep 2014 01:21:25 -0700 (PDT)
In-Reply-To: <20140925164857.GB6303@edge>
References: <CAF+2n7Tr+tqEq_R2cr0SuUQ8+PDB5tQKeCW2GLr=RW+-W35o_Q@mail.gmail.com>
	<CA+2YH7t7PVNKA6xT1QcCgGoPY_foe020_sxWk5dJYhmLqi8QYA@mail.gmail.com>
	<CAF+2n7QzdBhtZxJ6oi11KaUovc2PiWpN=Q4gBBm28tMjm3efXw@mail.gmail.com>
	<CA+2YH7uaRmXepsmmYXQQ8_UXzsOBnwo1QPxnCSf=xqU1s04Cew@mail.gmail.com>
	<CAF+2n7SGhcgMgD0AXoQb1=WV+P=ZiP9UEYe8RfOr+VxmhUAZuQ@mail.gmail.com>
	<CA+2YH7t1ET1YK3-0LqmL65S954CJAb4ACeKKpw=PPnzvCBtOBw@mail.gmail.com>
	<20140925164857.GB6303@edge>
Date: Fri, 26 Sep 2014 10:21:25 +0200
Message-ID: <CAF+2n7Szf5nu26M3ynOuE17=F1qWrwznh7Abt5Cc=0yHkTMq8A@mail.gmail.com>
From: Manuel Torres <manuel.torres.fernandez@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Video encoding on OMAP4430
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
X-List-Received-Date: Fri, 26 Sep 2014 08:22:01 -0000
Content-Type: multipart/alternative; boundary=047d7b2e549c683ec70503f39a62

--047d7b2e549c683ec70503f39a62
Content-Type: text/plain; charset=UTF-8

Is it too bad if I did not understand any of this: "Also you might need
"mm-accel" versions of gstreamer components, which are used when "mmip"
flag in MACHINE_FEATURES is set..."?

I included the meta-arago-extras layer, ran "bitbake-layers show-recipes"
and got this error:

Parsing recipes..ERROR: ExpansionError during parsing
/home/mtorres/Development/Gumstix/yocto/poky/meta-arago-extras/meta-arago-extras/recipes-core/meta/
external-arago-toolchain.bb: Failure expanding variable ARG_VER_MAIN[:=],
expression was ${@arg_get_main_version(d)} which triggered exception
TypeError: unsupported operand type(s) for +: 'NoneType' and 'str'
Traceback (most recent call last):
  File
"/home/mtorres/Development/Gumstix/yocto/poky/bitbake/bin/bitbake-layers",
line 726, in <module>
    sys.exit(main(sys.argv[1:]) or 0)
  File
"/home/mtorres/Development/Gumstix/yocto/poky/bitbake/bin/bitbake-layers",
line 50, in main
    cmds.onecmd(' '.join(args))
  File "/usr/lib/python2.7/cmd.py", line 221, in onecmd
    return func(arg)
  File
"/home/mtorres/Development/Gumstix/yocto/poky/bitbake/bin/bitbake-layers",
line 212, in do_show_recipes
    self.init_bbhandler()
  File
"/home/mtorres/Development/Gumstix/yocto/poky/bitbake/bin/bitbake-layers",
line 67, in init_bbhandler
    self.bbhandler.prepare(config_only)
  File
"/home/mtorres/Development/Gumstix/yocto/poky/bitbake/lib/bb/tinfoil.py",
line 82, in prepare
    self.parseRecipes()
  File
"/home/mtorres/Development/Gumstix/yocto/poky/bitbake/lib/bb/tinfoil.py",
line 65, in parseRecipes
    self.cooker.updateCache()
  File
"/home/mtorres/Development/Gumstix/yocto/poky/bitbake/lib/bb/cooker.py",
line 1309, in updateCache
    raise bb.BBHandledException()
bb.BBHandledException

I do not know how to address this error. I tried rolling back to a previous
Yocto version, from Daisy to Dora, but got the same error.

I will write to the meta-arago mailing list too. Thanks for the pointer.


On Thu, Sep 25, 2014 at 6:48 PM, Denys Dmytriyenko <denys@ti.com> wrote:

> There are some pieces of accelerated multimedia with gstreamer in
> meta-arago-extras:
>
>
> http://arago-project.org/git/?p=meta-arago.git;a=tree;f=meta-arago-extras/recipes-multimedia;hb=HEAD
>
> Although, those are currently being used for OMAP5 and derived parts, so
> compatibility with OMAP4 is not guaranteed. If you are adventurous enough,
> you
> are welcome to try those. You'd need gst-plugin-ducati and libdce.
>
> Also you might need "mm-accel" versions of gstreamer components, which are
> used when "mmip" flag in MACHINE_FEATURES is set...
>
> You would also be better off moving the further discussion to
> meta-arago@arago-project.org mailing list, since this is not BSP specific.
>
> --
> Denys
>
>
> On Thu, Sep 25, 2014 at 06:05:14PM +0200, Enrico wrote:
> > On Thu, Sep 25, 2014 at 5:57 PM, Manuel Torres
> > <manuel.torres.fernandez@gmail.com> wrote:
> > > Which console image should I build? The Arago or the Gumstix one?
> >
> > The arago one, just to be sure you have a working setup.
> >
> > (and btw you shouldn't have the gumstix one, because it's in
> gumstix-extras).
> >
> > Enrico
> >
> >
> > > On Thu, Sep 25, 2014 at 5:33 PM, Enrico <ebutera@users.sourceforge.net
> >
> > > wrote:
> > >>
> > >> On Thu, Sep 25, 2014 at 4:31 PM, Manuel Torres
> > >> <manuel.torres.fernandez@gmail.com> wrote:
> > >> > First of all, thank you for taking the time to help me.
> > >> >
> > >> > Now, back on topic: should I download the "meta-arago-extras" layer?
> > >> > That is
> > >> > what I found on Google when I searched for "gst-plugins-ducati".
> > >>
> > >> You should just follow the steps to build latest arago, build a simple
> > >> console-image and if everything is ok you can go on building gstreamer
> > >> and the ducati plugin.
> > >> You will need meta-gumstix of course.
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
>

--047d7b2e549c683ec70503f39a62
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Is it too bad if I did not understand any of this: &q=
uot;Also you might need &quot;mm-accel&quot; versions of gstreamer componen=
ts, which are used when &quot;mmip&quot; flag in MACHINE_FEATURES is set...=
&quot;?<br><br></div>I included the meta-arago-extras layer, ran &quot;bitb=
ake-layers show-recipes&quot; and got this error: <br><div><div><br>Parsing=
 recipes..ERROR: ExpansionError during parsing /home/mtorres/Development/Gu=
mstix/yocto/poky/meta-arago-extras/meta-arago-extras/recipes-core/meta/<a h=
ref=3D"http://external-arago-toolchain.bb">external-arago-toolchain.bb</a>:=
 Failure expanding variable ARG_VER_MAIN[:=3D], expression was ${@arg_get_m=
ain_version(d)} which triggered exception TypeError: unsupported operand ty=
pe(s) for +: &#39;NoneType&#39; and &#39;str&#39;<br>Traceback (most recent=
 call last):<br>=C2=A0 File &quot;/home/mtorres/Development/Gumstix/yocto/p=
oky/bitbake/bin/bitbake-layers&quot;, line 726, in &lt;module&gt;<br>=C2=A0=
=C2=A0=C2=A0 sys.exit(main(sys.argv[1:]) or 0)<br>=C2=A0 File &quot;/home/m=
torres/Development/Gumstix/yocto/poky/bitbake/bin/bitbake-layers&quot;, lin=
e 50, in main<br>=C2=A0=C2=A0=C2=A0 cmds.onecmd(&#39; &#39;.join(args))<br>=
=C2=A0 File &quot;/usr/lib/python2.7/cmd.py&quot;, line 221, in onecmd<br>=
=C2=A0=C2=A0=C2=A0 return func(arg)<br>=C2=A0 File &quot;/home/mtorres/Deve=
lopment/Gumstix/yocto/poky/bitbake/bin/bitbake-layers&quot;, line 212, in d=
o_show_recipes<br>=C2=A0=C2=A0=C2=A0 self.init_bbhandler()<br>=C2=A0 File &=
quot;/home/mtorres/Development/Gumstix/yocto/poky/bitbake/bin/bitbake-layer=
s&quot;, line 67, in init_bbhandler<br>=C2=A0=C2=A0=C2=A0 self.bbhandler.pr=
epare(config_only)<br>=C2=A0 File &quot;/home/mtorres/Development/Gumstix/y=
octo/poky/bitbake/lib/bb/tinfoil.py&quot;, line 82, in prepare<br>=C2=A0=C2=
=A0=C2=A0 self.parseRecipes()<br>=C2=A0 File &quot;/home/mtorres/Developmen=
t/Gumstix/yocto/poky/bitbake/lib/bb/tinfoil.py&quot;, line 65, in parseReci=
pes<br>=C2=A0=C2=A0=C2=A0 self.cooker.updateCache()<br>=C2=A0 File &quot;/h=
ome/mtorres/Development/Gumstix/yocto/poky/bitbake/lib/bb/cooker.py&quot;, =
line 1309, in updateCache<br>=C2=A0=C2=A0=C2=A0 raise bb.BBHandledException=
()<br>bb.BBHandledException<br><br></div><div>I do not know how to address =
this error. I tried rolling back to a previous Yocto version, from Daisy to=
 Dora, but got the same error.<br><br></div><div>I will write to the meta-a=
rago mailing list too. Thanks for the pointer.<br></div><div><br></div></di=
v></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, S=
ep 25, 2014 at 6:48 PM, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a href=3D"=
mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt;</span> wrote:<b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">There are some pieces of accelerated multi=
media with gstreamer in<br>
meta-arago-extras:<br>
<br>
<a href=3D"http://arago-project.org/git/?p=3Dmeta-arago.git;a=3Dtree;f=3Dme=
ta-arago-extras/recipes-multimedia;hb=3DHEAD" target=3D"_blank">http://arag=
o-project.org/git/?p=3Dmeta-arago.git;a=3Dtree;f=3Dmeta-arago-extras/recipe=
s-multimedia;hb=3DHEAD</a><br>
<br>
Although, those are currently being used for OMAP5 and derived parts, so<br=
>
compatibility with OMAP4 is not guaranteed. If you are adventurous enough, =
you<br>
are welcome to try those. You&#39;d need gst-plugin-ducati and libdce.<br>
<br>
Also you might need &quot;mm-accel&quot; versions of gstreamer components, =
which are<br>
used when &quot;mmip&quot; flag in MACHINE_FEATURES is set...<br>
<br>
You would also be better off moving the further discussion to<br>
<a href=3D"mailto:meta-arago@arago-project.org">meta-arago@arago-project.or=
g</a> mailing list, since this is not BSP specific.<br>
<br>
--<br>
Denys<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
On Thu, Sep 25, 2014 at 06:05:14PM +0200, Enrico wrote:<br>
&gt; On Thu, Sep 25, 2014 at 5:57 PM, Manuel Torres<br>
&gt; &lt;<a href=3D"mailto:manuel.torres.fernandez@gmail.com">manuel.torres=
.fernandez@gmail.com</a>&gt; wrote:<br>
&gt; &gt; Which console image should I build? The Arago or the Gumstix one?=
<br>
&gt;<br>
&gt; The arago one, just to be sure you have a working setup.<br>
&gt;<br>
&gt; (and btw you shouldn&#39;t have the gumstix one, because it&#39;s in g=
umstix-extras).<br>
&gt;<br>
&gt; Enrico<br>
&gt;<br>
&gt;<br>
&gt; &gt; On Thu, Sep 25, 2014 at 5:33 PM, Enrico &lt;<a href=3D"mailto:ebu=
tera@users.sourceforge.net">ebutera@users.sourceforge.net</a>&gt;<br>
&gt; &gt; wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On Thu, Sep 25, 2014 at 4:31 PM, Manuel Torres<br>
&gt; &gt;&gt; &lt;<a href=3D"mailto:manuel.torres.fernandez@gmail.com">manu=
el.torres.fernandez@gmail.com</a>&gt; wrote:<br>
&gt; &gt;&gt; &gt; First of all, thank you for taking the time to help me.<=
br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Now, back on topic: should I download the &quot;meta-ara=
go-extras&quot; layer?<br>
&gt; &gt;&gt; &gt; That is<br>
&gt; &gt;&gt; &gt; what I found on Google when I searched for &quot;gst-plu=
gins-ducati&quot;.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; You should just follow the steps to build latest arago, build=
 a simple<br>
&gt; &gt;&gt; console-image and if everything is ok you can go on building =
gstreamer<br>
&gt; &gt;&gt; and the ducati plugin.<br>
&gt; &gt;&gt; You will need meta-gumstix of course.<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">&gt; --<br>
&gt; _______________________________________________<br>
&gt; meta-ti mailing list<br>
&gt; <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</=
a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" target=3D"=
_blank">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
</font></span></blockquote></div><br></div>

--047d7b2e549c683ec70503f39a62--
