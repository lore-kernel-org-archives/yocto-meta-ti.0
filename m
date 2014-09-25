Return-Path: <diego.sueiro@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ACD42E00899; Thu, 25 Sep 2014 09:25:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (diego.sueiro[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.179 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B37CFE008AA
	for <meta-ti@yoctoproject.org>; Thu, 25 Sep 2014 09:25:09 -0700 (PDT)
Received: by mail-qc0-f179.google.com with SMTP id l6so5085906qcy.10
	for <meta-ti@yoctoproject.org>; Thu, 25 Sep 2014 09:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=JV+BiWmMJKZfat2acChVuJT/JIsDrk4bCW3sKdohZ2k=;
	b=S8Fa65QwzDrTF4zNrw3COq8N0R8Dg2WNzwpadDgY2IX//sU/U3C6C0WfqcxyIAYe23
	MO85gNqhKXDJBWXoyRLRpZkspMhiqDosvPTzmBuoGFxV/aq/rmPL7zDFb5wNcGI0CK+X
	D7y5+g9c2w/QHhMPUfKT79VgujqnbyTnsbwgFa17naBZVmejnOdR789tHNUMxNy1Tj5h
	kR007MVTxJxvsCNDC7bWpAVevJGD11m2v087VYtykUBWhVgc5HQyzcd5KIsDv555n9aJ
	IWeTynucENKL3nivKoyMdu1vtJm1p4X9O1fMa5qrvzAE1aOlJJwgt6tqVd0i0rnv8KqT
	WjYQ==
X-Received: by 10.224.115.139 with SMTP id i11mr18014820qaq.86.1411662308878; 
	Thu, 25 Sep 2014 09:25:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.83 with HTTP; Thu, 25 Sep 2014 09:24:48 -0700 (PDT)
In-Reply-To: <20140925162004.GA6303@edge>
References: <1411405491-30435-1-git-send-email-denis@denix.org>
	<CAMCfZKHU6GkJMrKBUHJbPttyoKvnb0xqDAEHxysi-W-B1U3scQ@mail.gmail.com>
	<20140924155211.GZ6303@edge>
	<CAMCfZKGPy3mLD_4_4ZJCHQs-=3HjvMk6KkD8Z8_HFhi=jmMhVw@mail.gmail.com>
	<20140925162004.GA6303@edge>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Thu, 25 Sep 2014 13:24:48 -0300
Message-ID: <CAMCfZKFick=7LHd4ZTwMf-68YJKTccvr+7iYWoirqFkP9KOAkQ@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] linux-ti-staging: update to 3.14.19 with latest fixes
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
X-List-Received-Date: Thu, 25 Sep 2014 16:25:12 -0000
Content-Type: multipart/alternative; boundary=047d7bdc8c2876ae7e0503e63e65

--047d7bdc8c2876ae7e0503e63e65
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Sep 25, 2014 at 1:20 PM, Denys Dmytriyenko <denys@ti.com> wrote:

> On Thu, Sep 25, 2014 at 09:04:58AM -0300, Diego Sueiro wrote:
> > On Wed, Sep 24, 2014 at 12:52 PM, Denys Dmytriyenko <denys@ti.com>
> wrote:
> >
> > > Do you need to submit a bug report? Is it for kernel or some other
> > > component?
> >
> > Not at all.
> > Just thinking about to have a place where I can easily track issues,
> solved
> > bugs and enhancements for both kernel and u-boot projects. I wish I could
> > have an idea on what to expect from TI's work.
>
> Well, this is meant to be an internal release and a staging area. The
> official
> deliverable for the community is the mainline, although that takes longer
> time
> for everything to get upstreamed and accepted in to the mainline... There
> is,
> of course, an internal resource for tracking everything, but I don't think
> it's meant for public consumption...
>
>
Ok. Thanks.


>
> > The gitorious web interface is the worst available for opensource
> projects.
>
> I prefer gitweb interface myself:
>
> http://git.ti.com/gitweb/


Better than gitorious. :-)


Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br
<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

--047d7bdc8c2876ae7e0503e63e65
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Sep 25, 2014 at 1:20 PM, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Thu, Sep 25, =
2014 at 09:04:58AM -0300, Diego Sueiro wrote:<br>
&gt; On Wed, Sep 24, 2014 at 12:52 PM, Denys Dmytriyenko &lt;<a href=3D"mai=
lto:denys@ti.com">denys@ti.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; Do you need to submit a bug report? Is it for kernel or some othe=
r<br>
&gt; &gt; component?<br>
&gt;<br>
&gt; Not at all.<br>
&gt; Just thinking about to have a place where I can easily track issues, s=
olved<br>
&gt; bugs and enhancements for both kernel and u-boot projects. I wish I co=
uld<br>
&gt; have an idea on what to expect from TI&#39;s work.<br>
<br>
</span>Well, this is meant to be an internal release and a staging area. Th=
e official<br>
deliverable for the community is the mainline, although that takes longer t=
ime<br>
for everything to get upstreamed and accepted in to the mainline... There i=
s,<br>
of course, an internal resource for tracking everything, but I don&#39;t th=
ink<br>
it&#39;s meant for public consumption...<br>
<span class=3D""><br></span></blockquote><div>=A0</div><div>Ok. Thanks.</di=
v><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">
<br>
&gt; The gitorious web interface is the worst available for opensource proj=
ects.<br>
<br>
</span>I prefer gitweb interface myself:<br>
<br>
<a href=3D"http://git.ti.com/gitweb/" target=3D"_blank">http://git.ti.com/g=
itweb/</a></blockquote></div><br>Better than gitorious. :-)<br><br><br clea=
r=3D"all"><div><div dir=3D"ltr"><div>Regards,</div><div><br></div>--<br>*dS=
<br>Diego Sueiro<br><br>Administrador do Embarcados<br><a href=3D"http://ww=
w.embarcados.com.br/?utm_source=3Dassinatura_diego&amp;utm_medium=3De-mail&=
amp;utm_campaign=3DAssinatura%20Email%20Diego" target=3D"_blank">www.embarc=
ados.com.br</a><br><br>/*long live rock &#39;n roll*/<br></div></div>
</div></div>

--047d7bdc8c2876ae7e0503e63e65--
