Return-Path: <b.hutchman@gmail.com>
Received: from mail-ob0-f178.google.com (mail-ob0-f178.google.com
	[209.85.214.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 715B0E00408
	for <meta-ti@yoctoproject.org>; Fri,  9 Aug 2013 17:25:50 -0700 (PDT)
Received: by mail-ob0-f178.google.com with SMTP id ef5so7010427obb.37
	for <meta-ti@yoctoproject.org>; Fri, 09 Aug 2013 17:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=nvtYHNJYJA52NdPmZHfsN3Wvjy1RDAIehA8vUGxruek=;
	b=Mf5+3CRe3wjg0/A1Me7xeDOa+7xgPCtg3y+YbqlfueyWZgjDt1+DkTKpsE45bYYH4W
	JNWfZDWQLvWm87Onwu7J7GlIc9SoZGbGFWRR8iC3qkBvqpaCfxoSIrIldVELPpSq0BHQ
	szHGTR5QLcBORYPixfSQxjMYXo3qeP6LFxAuPlAsqmxnb8fSbzLhqw2uUczyoO/TOBGl
	6BBJRbabytW3kyMBRNKAkQDQY6QIxZN3FrqEP0aImCrtB5ICF0Q1/6QUCFXw1tQTPpvu
	b+sRVH1WGdksfOpFsfg5ySwhqdacIpZjWUO+1V2sDbW6U7bvWMW+pKlxxXUSYRVuO4nx
	zy5w==
MIME-Version: 1.0
X-Received: by 10.60.52.244 with SMTP id w20mr2511275oeo.30.1376094350120;
	Fri, 09 Aug 2013 17:25:50 -0700 (PDT)
Received: by 10.60.142.41 with HTTP; Fri, 9 Aug 2013 17:25:49 -0700 (PDT)
Received: by 10.60.142.41 with HTTP; Fri, 9 Aug 2013 17:25:49 -0700 (PDT)
In-Reply-To: <CAFZh4h8MZBVtwCUisoaNnBrd=Y81jZkrkhKAZUx2+JcBvTWepA@mail.gmail.com>
References: <alpine.DEB.2.02.1308091920590.10592@oneiric>
	<CAFZh4h8MZBVtwCUisoaNnBrd=Y81jZkrkhKAZUx2+JcBvTWepA@mail.gmail.com>
Date: Fri, 9 Aug 2013 20:25:49 -0400
Message-ID: <CAFZh4h9V7-06jGW2Sz4ksKRFEBabDchiY2aMdMeriF6NGPxJ8g@mail.gmail.com>
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
X-List-Received-Date: Sat, 10 Aug 2013 00:25:51 -0000
Content-Type: multipart/alternative; boundary=001a11334600ea9cfa04e38cee9d

--001a11334600ea9cfa04e38cee9d
Content-Type: text/plain; charset=ISO-8859-1

On Aug 9, 2013 8:22 PM, "Brian Hutchinson" <b.hutchman@gmail.com> wrote:
>
>
> On Aug 9, 2013 7:23 PM, "Robert P. J. Day" <rpjday@crashcourse.ca> wrote:
> >
> >
> >   trying to build for beaglebone, getting:
> >
> > ERROR: No recipes available for:
> >
/home/rpjday/oe/dist/layers/meta-ti/recipes-graphics/mesa/mesa_9.1.5.bbappend
> > ERROR: Command execution failed: Exited with 1
> >
> > should meta-ti master stay in sync with oe-core master (which has a
> > recipe for 9.1.6), or is there a different combo of layers to use?
> > thanks.
> >
> > rday
> >
>
> Hi Robert,
>
> I ran into the same thing the other day.  Yes, yocto master should be
used with meta-ti master as far as I know.  I've ran into trouble mixing
branch layers before.
>
> My problem happened after I did a git pull on everything.  I also had
other problems besides the one you mentioned.  I suspect the update messed
something up as I did another checkout of yocto master and meta-ti master
and had a clean build.  Makes me suspect something in the git pull that
hosed something up.
>
> Regards,
>
> Brian

As a stop gap measure, I did just rename the bbappend to 9.1.6 and that
solved my mesa problem but then I had toolchain build problems.  When I did
a fresh checkout, I did not get the mesa error for the mesa 9.1.5.

Regards,

Brian

--001a11334600ea9cfa04e38cee9d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Aug 9, 2013 8:22 PM, &quot;Brian Hutchinson&quot; &lt;<a href=3D"mailto:=
b.hutchman@gmail.com">b.hutchman@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; On Aug 9, 2013 7:23 PM, &quot;Robert P. J. Day&quot; &lt;<a href=3D"ma=
ilto:rpjday@crashcourse.ca">rpjday@crashcourse.ca</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; =A0 trying to build for beaglebone, getting:<br>
&gt; &gt;<br>
&gt; &gt; ERROR: No recipes available for:<br>
&gt; &gt; /home/rpjday/oe/dist/layers/meta-ti/recipes-graphics/mesa/mesa_9.=
1.5.bbappend<br>
&gt; &gt; ERROR: Command execution failed: Exited with 1<br>
&gt; &gt;<br>
&gt; &gt; should meta-ti master stay in sync with oe-core master (which has=
 a<br>
&gt; &gt; recipe for 9.1.6), or is there a different combo of layers to use=
?<br>
&gt; &gt; thanks.<br>
&gt; &gt;<br>
&gt; &gt; rday<br>
&gt; &gt;<br>
&gt;<br>
&gt; Hi Robert,<br>
&gt;<br>
&gt; I ran into the same thing the other day.=A0 Yes, yocto master should b=
e used with meta-ti master as far as I know.=A0 I&#39;ve ran into trouble m=
ixing branch layers before.<br>
&gt;<br>
&gt; My problem happened after I did a git pull on everything.=A0 I also ha=
d other problems besides the one you mentioned.=A0 I suspect the update mes=
sed something up as I did another checkout of yocto master and meta-ti mast=
er and had a clean build.=A0 Makes me suspect something in the git pull tha=
t hosed something up.<br>

&gt;<br>
&gt; Regards,<br>
&gt;<br>
&gt; Brian</p>
<p dir=3D"ltr">As a stop gap measure, I did just rename the bbappend to 9.1=
.6 and that solved my mesa problem but then I had toolchain build problems.=
=A0 When I did a fresh checkout, I did not get the mesa error for the mesa =
9.1.5.</p>

<p dir=3D"ltr">Regards,</p>
<p dir=3D"ltr">Brian<br>
</p>

--001a11334600ea9cfa04e38cee9d--
