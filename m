Return-Path: <exosyst@gmail.com>
Received: from mail-ye0-f176.google.com (mail-ye0-f176.google.com
	[209.85.213.176]) (using TLSv1 with cipher RC4-SHA (128/128 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id 0CA02E0071D
	for <meta-ti@yoctoproject.org>; Mon, 18 Feb 2013 13:37:11 -0800 (PST)
Received: by mail-ye0-f176.google.com with SMTP id m1so1103673yen.35
	for <meta-ti@yoctoproject.org>; Mon, 18 Feb 2013 13:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=GLu/ibLPbZVMgu4C06H8cLPFp9P1p4T8MUPHMJDiUTY=;
	b=RcIPlBNLnVYFkH5biGzdLqy3iOihEe1FAFfGja21tUQBeNXxkTy6ISqGm5uN9JjKMe
	cQ+asqOvwQOmr+96HRdawBWshGlxdQKbnUGTmKQ1QDsdFJhXKEXvMyA+QyiZ1quxE+Qz
	cAqivs94eXV+YxbkC1mihfkdsaBfPPgnqAizl9VyFCay0KIMXztZ8N/umAMHaGyeIaEl
	Y9RYvkq2sz1t3Rxei2dWLBDssx+eARuj7A6D9YeZBXlKQdzdL72s8P8mNwtDq59xxgUX
	3fzNcNfbszVRfVwJwXNC8khI2StXXCv8AxUhZMuPth6vMbFRa/7R5ZR0BEyFgJQVoqgs
	a3kw==
X-Received: by 10.101.218.12 with SMTP id v12mr6881007anq.32.1361223431088;
	Mon, 18 Feb 2013 13:37:11 -0800 (PST)
MIME-Version: 1.0
Sender: exosyst@gmail.com
Received: by 10.101.187.2 with HTTP; Mon, 18 Feb 2013 13:36:50 -0800 (PST)
In-Reply-To: <CAOT3miKb1nEMwp03OGnyDV31O5NAWvZKiZSj7piyVJf-jQhLEg@mail.gmail.com>
References: <CACMnT39zosRxQfXXoQ8Pbwwtqa2GzKqyqWj2bgU23u4SwM_ypQ@mail.gmail.com>
	<CAOT3miKb1nEMwp03OGnyDV31O5NAWvZKiZSj7piyVJf-jQhLEg@mail.gmail.com>
From: Nick G <exosyst+metaTI@gmail.com>
Date: Mon, 18 Feb 2013 21:36:50 +0000
X-Google-Sender-Auth: O-XgE9BoOp6t5d-DKh5jfEsC_bQ
Message-ID: <CAN-pQATiMWdQd_t91-8ZDVX2HUwdeoFAUfAgVfMZXB2niVB16Q@mail.gmail.com>
To: Nicolas Dechesne <ndec13@gmail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	Jesse Dannenbring <jtdannenbring@gmail.com>
Subject: Re: Error building after "mesa-dri update to 9.0.1"
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
X-List-Received-Date: Mon, 18 Feb 2013 21:37:12 -0000
Content-Type: multipart/alternative; boundary=001636ed720d11ebc304d606872f

--001636ed720d11ebc304d606872f
Content-Type: text/plain; charset=ISO-8859-1

Hey guys,

I'm having this same issue and I've checked out poky and meta-ti from Git
this evening so nothing to do with Danny.
Is this not the preferred method? I'm struggling to find good step-by-step
resources for getting going on a build for my beaglebone.

Regards,
Nick

On 11 February 2013 19:58, Nicolas Dechesne <ndec13@gmail.com> wrote:

> On Fri, Jan 25, 2013 at 11:51 PM, Jesse Dannenbring
> <jtdannenbring@gmail.com> wrote:
> > I previously was building meta-ti without issue but I repeated the
> process
> > recently and found that the patch on 2013-01-10 broke my build:
> >
> > bitbake -c fetchall core-image-minimal
> > Pseudo is not present but is required, building this first before the
> main
> > build
> > Parsing recipes: 100% |#########################################| Time:
> > 00:02:54
> > Parsing of 891 .bb files complete (0 cached, 891 parsed). 1197 targets,
> 64
> > skipped, 7 masked, 0 errors.
> > ERROR: No recipes available for:
> >
> >
> /home/jesse/yocto/poky-danny-8.0/meta-ti/recipes-graphics/mesa/mesa-dri_9.0.1.bbappend
> > ERROR: Command execution failed: Exited with 1
>
> you are probably using meta-ti/master with poky/danny branch, which is
> not expected to work. if you want to use danny, then use 'danny'
> branch from meta-ti too.
>
> nicolas
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>

--001636ed720d11ebc304d606872f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hey guys,<br><br>I&#39;m having this same issue and I&#39;ve checked out po=
ky and meta-ti from Git this evening so nothing to do with Danny.<br>Is thi=
s not the preferred method? I&#39;m struggling to find good step-by-step re=
sources for getting going on a build for my beaglebone.<br>

<br>Regards,<br>Nick<br><br><div class=3D"gmail_quote">On 11 February 2013 =
19:58, Nicolas Dechesne <span dir=3D"ltr">&lt;<a href=3D"mailto:ndec13@gmai=
l.com" target=3D"_blank">ndec13@gmail.com</a>&gt;</span> wrote:<br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">

<div class=3D"HOEnZb"><div class=3D"h5">On Fri, Jan 25, 2013 at 11:51 PM, J=
esse Dannenbring<br>
&lt;<a href=3D"mailto:jtdannenbring@gmail.com">jtdannenbring@gmail.com</a>&=
gt; wrote:<br>
&gt; I previously was building meta-ti without issue but I repeated the pro=
cess<br>
&gt; recently and found that the patch on 2013-01-10 broke my build:<br>
&gt;<br>
&gt; bitbake -c fetchall core-image-minimal<br>
&gt; Pseudo is not present but is required, building this first before the =
main<br>
&gt; build<br>
&gt; Parsing recipes: 100% |#########################################| Time=
:<br>
&gt; 00:02:54<br>
&gt; Parsing of 891 .bb files complete (0 cached, 891 parsed). 1197 targets=
, 64<br>
&gt; skipped, 7 masked, 0 errors.<br>
&gt; ERROR: No recipes available for:<br>
&gt;<br>
&gt; /home/jesse/yocto/poky-danny-8.0/meta-ti/recipes-graphics/mesa/mesa-dr=
i_9.0.1.bbappend<br>
&gt; ERROR: Command execution failed: Exited with 1<br>
<br>
</div></div>you are probably using meta-ti/master with poky/danny branch, w=
hich is<br>
not expected to work. if you want to use danny, then use &#39;danny&#39;<br=
>
branch from meta-ti too.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
nicolas<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5">_____________________=
__________________________<br>
meta-ti mailing list<br>
<a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</a><br=
>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" target=3D"_blan=
k">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
</div></div></blockquote></div><br>

--001636ed720d11ebc304d606872f--
