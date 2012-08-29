Return-Path: <sbaskana@gmail.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7DC13E0074B
	for <meta-ti@yoctoproject.org>; Wed, 29 Aug 2012 10:17:28 -0700 (PDT)
Received: by weyu3 with SMTP id u3so525128wey.35
	for <meta-ti@yoctoproject.org>; Wed, 29 Aug 2012 10:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=hgMAUkMbPoDVNzYRBoT7kod7uuPMJCb9C7vAIuEZOng=;
	b=UwHcngQBu6CEJ0WqlZFjN/0YmpktCtC6z4d6EHhaRGMeSYTDzVWmOOXc5ntAXamW++
	eTomLGNSPyLPTgIix6N3RF1A2RporbswOFTl5oWqaM0KqAfNFis/bhXHWkdaIrfo2tjU
	5HtGRPLewFRFVM1fAYsYIZ5WxFk3OUu7bRqgBy3OPhoJHkyOsPyW2HQidcg8RltPS+64
	n2NW8uD1ATSnsdTf4hUZrjr2WWPiPSbRWzF6TrCLG7F17gbtS8ru3q8cqy7bfYJN+qgi
	CC7dIowuMwnxJAMzHFu4V/6SZmFKVuqHs5bwVF3WpILoEEr3gK8lfrjrzN0JSkSyRB8h
	nvFg==
MIME-Version: 1.0
Received: by 10.216.237.149 with SMTP id y21mr1327223weq.102.1346260647067;
	Wed, 29 Aug 2012 10:17:27 -0700 (PDT)
Received: by 10.216.239.74 with HTTP; Wed, 29 Aug 2012 10:17:26 -0700 (PDT)
In-Reply-To: <20120829165904.GH23636@edge>
References: <CALjj03XPWGLXGAeDxJzg8_ap_ai=9=CnQwms5dujL7oNsmBkCw@mail.gmail.com>
	<503D3DFE.3020000@balister.org> <20120829165904.GH23636@edge>
Date: Wed, 29 Aug 2012 13:17:26 -0400
Message-ID: <CALjj03XKUHiopWA=jO3Y9WSLr5NFFy5BXV+L8sAfEiK9PyUf+Q@mail.gmail.com>
From: =?ISO-8859-1?Q?Sebasti=E1n_Bas_Kana?= <sbaskana@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
X-Mailman-Approved-At: Thu, 30 Aug 2012 10:35:12 -0700
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	gumstix-users@lists.sourceforge.net
Subject: Re: [Gumstix-users] Yocto and Wifi for Overo
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
X-List-Received-Date: Wed, 29 Aug 2012 17:17:29 -0000
Content-Type: multipart/alternative; boundary=000e0cd5f2c0a4c01804c86abb09

--000e0cd5f2c0a4c01804c86abb09
Content-Type: text/plain; charset=ISO-8859-1

I did read it carefully and used the BBMASK variable, but it still fails to
build the "base" image.

I'll be trying some other things and report back if I have any success. Any
information and/or learning resource you can share would be really
appreciated.

Thank you!

Sebastian

On Wed, Aug 29, 2012 at 12:59 PM, Denys Dmytriyenko <denys@ti.com> wrote:

> On Tue, Aug 28, 2012 at 03:54:06PM -0600, Philip Balister wrote:
> > FYI.
> >
> >
> > I used meta-gumstix and had to add meta-ti, but the latter has some
> issues
> > with licensing checksums and broken dependencies, so I removed the
>
> "Issues with licensing checksums and broken dependencies" means not
> following
> instructions in the README file, which clearly says if you don't use
> meta-oe,
> you need BBMASK.
>
> BTW, it used to work and not complain about missing license even w/o BBMASK
> until some time recently, when a more stricter QA check was added to
> oe-core/bitbake. We've discussed it on #yocto some time ago and I have a
> small
> workaround for that pending...
>
>
> > conflicting files and had to build the core-image-minimal, as the "base"
> > one fails to build the root filesystem.
> >
> > To enable WPA Wifi I followed what is explained on this thread:
> >
> > http://comments.gmane.org/gmane.linux.embedded.yocto.meta-ti/631
> >
> > Is there a cleaner way to do this? Why is meta-ti broken?
>
> Again, read the README file carefully, which is supplied with meta-ti, as
> well as all the other layers.
>
> --
> Denys
>
>
> > Thank you for your help!
> >
> > Sebasti?n
> >
> > On Fri, Aug 24, 2012 at 4:48 PM, Andreas M?ller <
> > schnitzeltony@googlemail.com> wrote:
> >
> > >On Fri, Aug 24, 2012 at 5:27 PM, Sebasti?n Bas Kana <sbaskana@gmail.com
> >
> > >wrote:
> > >> Hi Guys,
> > >>
> > >> Has anyone been able to build a Wifi (WPA) enabled image for the overo
> > >with
> > >> Yocto?
> > >>
> > >> I keep getting errors when I try to configure wlan0. How can I get the
> > >> drivers working?
> > >>
> > >> Thank you in advance!
> > >>
> > >> Sebasti?n
> > >>
> > >with meta-gumstix and networkmanager in image (e.g [1]) I have no
> > >problem to connect my hidden WPA2 network and setup is easy.
> > >
> > >Andreas
> > >
> > >[1]
> > >
> http://gitorious.org/schnitzeltony-oe-meta/meta-misc/blobs/master/recipes-image/xfce-base-image.bb
> > >
> > >
> >
> >------------------------------------------------------------------------------
> > >Live Security Virtual Conference
> > >Exclusive live event will cover all the ways today's security and
> > >threat landscape has changed and how IT managers can respond.
> Discussions
> > >will include endpoint security, mobile security and the latest in
> malware
> > >threats. http://www.accelacomm.com/jaw/sfrnl04242012/114/50122263/
> > >_______________________________________________
> > >gumstix-users mailing list
> > >gumstix-users@lists.sourceforge.net
> > >https://lists.sourceforge.net/lists/listinfo/gumstix-users
> > >
> >
> >
> >
>
> >
> ------------------------------------------------------------------------------
> > Live Security Virtual Conference
> > Exclusive live event will cover all the ways today's security and
> > threat landscape has changed and how IT managers can respond. Discussions
> > will include endpoint security, mobile security and the latest in malware
> > threats. http://www.accelacomm.com/jaw/sfrnl04242012/114/50122263/
>
> > _______________________________________________
> > gumstix-users mailing list
> > gumstix-users@lists.sourceforge.net
> > https://lists.sourceforge.net/lists/listinfo/gumstix-users
> >
>
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
>
>

--000e0cd5f2c0a4c01804c86abb09
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I did read it carefully and used the BBMASK variable, but it still fails to=
 build the &quot;base&quot; image.<div><br></div><div>I&#39;ll be trying so=
me other things and report back if I have any success. Any information and/=
or learning resource you can share would be really appreciated.</div>
<div><br></div><div>Thank you!</div><div><br></div><div>Sebastian=A0<br><br=
><div class=3D"gmail_quote">On Wed, Aug 29, 2012 at 12:59 PM, Denys Dmytriy=
enko <span dir=3D"ltr">&lt;<a href=3D"mailto:denys@ti.com" target=3D"_blank=
">denys@ti.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">On Tue, Aug 28, 2012 at 03:54:06PM -0600, Ph=
ilip Balister wrote:<br>
&gt; FYI.<br>
<div class=3D"im">&gt;<br>
&gt;<br>
&gt; I used meta-gumstix and had to add meta-ti, but the latter has some is=
sues<br>
&gt; with licensing checksums and broken dependencies, so I removed the<br>
<br>
</div>&quot;Issues with licensing checksums and broken dependencies&quot; m=
eans not following<br>
instructions in the README file, which clearly says if you don&#39;t use me=
ta-oe,<br>
you need BBMASK.<br>
<br>
BTW, it used to work and not complain about missing license even w/o BBMASK=
<br>
until some time recently, when a more stricter QA check was added to<br>
oe-core/bitbake. We&#39;ve discussed it on #yocto some time ago and I have =
a small<br>
workaround for that pending...<br>
<div class=3D"im"><br>
<br>
&gt; conflicting files and had to build the core-image-minimal, as the &quo=
t;base&quot;<br>
&gt; one fails to build the root filesystem.<br>
&gt;<br>
&gt; To enable WPA Wifi I followed what is explained on this thread:<br>
&gt;<br>
&gt; <a href=3D"http://comments.gmane.org/gmane.linux.embedded.yocto.meta-t=
i/631" target=3D"_blank">http://comments.gmane.org/gmane.linux.embedded.yoc=
to.meta-ti/631</a><br>
&gt;<br>
&gt; Is there a cleaner way to do this? Why is meta-ti broken?<br>
<br>
</div>Again, read the README file carefully, which is supplied with meta-ti=
, as<br>
well as all the other layers.<br>
<br>
--<br>
Denys<br>
<div class=3D"im"><br>
<br>
&gt; Thank you for your help!<br>
&gt;<br>
</div>&gt; Sebasti?n<br>
&gt;<br>
&gt; On Fri, Aug 24, 2012 at 4:48 PM, Andreas M?ller &lt;<br>
&gt; <a href=3D"mailto:schnitzeltony@googlemail.com">schnitzeltony@googlema=
il.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt;On Fri, Aug 24, 2012 at 5:27 PM, Sebasti?n Bas Kana &lt;<a href=3D=
"mailto:sbaskana@gmail.com">sbaskana@gmail.com</a>&gt;<br>
<div class=3D"im">&gt; &gt;wrote:<br>
&gt; &gt;&gt; Hi Guys,<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Has anyone been able to build a Wifi (WPA) enabled image for =
the overo<br>
&gt; &gt;with<br>
&gt; &gt;&gt; Yocto?<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I keep getting errors when I try to configure wlan0. How can =
I get the<br>
&gt; &gt;&gt; drivers working?<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Thank you in advance!<br>
&gt; &gt;&gt;<br>
</div>&gt; &gt;&gt; Sebasti?n<br>
<div><div class=3D"h5">&gt; &gt;&gt;<br>
&gt; &gt;with meta-gumstix and networkmanager in image (e.g [1]) I have no<=
br>
&gt; &gt;problem to connect my hidden WPA2 network and setup is easy.<br>
&gt; &gt;<br>
&gt; &gt;Andreas<br>
&gt; &gt;<br>
&gt; &gt;[1]<br>
&gt; &gt;<a href=3D"http://gitorious.org/schnitzeltony-oe-meta/meta-misc/bl=
obs/master/recipes-image/xfce-base-image.bb" target=3D"_blank">http://gitor=
ious.org/schnitzeltony-oe-meta/meta-misc/blobs/master/recipes-image/xfce-ba=
se-image.bb</a><br>

&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;------------------------------------------------------------------=
------------<br>
&gt; &gt;Live Security Virtual Conference<br>
&gt; &gt;Exclusive live event will cover all the ways today&#39;s security =
and<br>
&gt; &gt;threat landscape has changed and how IT managers can respond. Disc=
ussions<br>
&gt; &gt;will include endpoint security, mobile security and the latest in =
malware<br>
&gt; &gt;threats. <a href=3D"http://www.accelacomm.com/jaw/sfrnl04242012/11=
4/50122263/" target=3D"_blank">http://www.accelacomm.com/jaw/sfrnl04242012/=
114/50122263/</a><br>
&gt; &gt;_______________________________________________<br>
&gt; &gt;gumstix-users mailing list<br>
&gt; &gt;<a href=3D"mailto:gumstix-users@lists.sourceforge.net">gumstix-use=
rs@lists.sourceforge.net</a><br>
&gt; &gt;<a href=3D"https://lists.sourceforge.net/lists/listinfo/gumstix-us=
ers" target=3D"_blank">https://lists.sourceforge.net/lists/listinfo/gumstix=
-users</a><br>
&gt; &gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
<br>
&gt; ----------------------------------------------------------------------=
--------<br>
&gt; Live Security Virtual Conference<br>
&gt; Exclusive live event will cover all the ways today&#39;s security and<=
br>
&gt; threat landscape has changed and how IT managers can respond. Discussi=
ons<br>
&gt; will include endpoint security, mobile security and the latest in malw=
are<br>
&gt; threats. <a href=3D"http://www.accelacomm.com/jaw/sfrnl04242012/114/50=
122263/" target=3D"_blank">http://www.accelacomm.com/jaw/sfrnl04242012/114/=
50122263/</a><br>
<br>
&gt; _______________________________________________<br>
&gt; gumstix-users mailing list<br>
&gt; <a href=3D"mailto:gumstix-users@lists.sourceforge.net">gumstix-users@l=
ists.sourceforge.net</a><br>
&gt; <a href=3D"https://lists.sourceforge.net/lists/listinfo/gumstix-users"=
 target=3D"_blank">https://lists.sourceforge.net/lists/listinfo/gumstix-use=
rs</a><br>
&gt;<br>
<br>
</div></div>&gt; _______________________________________________<br>
&gt; meta-ti mailing list<br>
&gt; <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</=
a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" target=3D"=
_blank">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
<br>
</blockquote></div><br></div>

--000e0cd5f2c0a4c01804c86abb09--
