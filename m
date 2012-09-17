Return-Path: <ebutera@gmail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AE377E0027F
	for <meta-ti@yoctoproject.org>; Mon, 17 Sep 2012 13:36:23 -0700 (PDT)
Received: by vcbgb22 with SMTP id gb22so1531913vcb.35
	for <meta-ti@yoctoproject.org>; Mon, 17 Sep 2012 13:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=t6/DtZ6L2dG57U4DP4fe+2hdDWyhn5/ZjsbxNR8cB94=;
	b=Pmkve6vjdBsxOy1ObjEpMwTg+HPwLaXkbqS2s47uyfK8Q+5S7Y3vR1NV/BVfjEKYnZ
	4WIzsn5a2glw+xNCGVwgodDbfFCBmA8PLU+Q0HhwrOyAfk8U2BPyOBlm/gpLHXQ0EqEv
	wDzumXeVEkg7w/Jj4AbsXXVM2BHsDr7JFVIb6Fuy3Asd3N1wErEyeinTF4UA6D49eSys
	AhlzJ1n7XtzoLr4m8gdfR21PzqoWoUlcEFlqp4TQym7TZ9P7cn4nrJ4fYuT6k/dbq/Qq
	7QT9GPo9R0vAxy3bF6Y0Ul/vdjcwyqQI0AyPiupjht/xulGLu32Cy+McaPz9GSrT3l7l
	whmQ==
MIME-Version: 1.0
Received: by 10.52.33.130 with SMTP id r2mr3966940vdi.43.1347914180493; Mon,
	17 Sep 2012 13:36:20 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.220.226.196 with HTTP; Mon, 17 Sep 2012 13:36:20 -0700 (PDT)
In-Reply-To: <7D46E86EC0A8354091174257B2FED101591F5F33@DLEE12.ent.ti.com>
References: <20120914064306.GC26968@edge>
	<7D46E86EC0A8354091174257B2FED101591F5F33@DLEE12.ent.ti.com>
Date: Mon, 17 Sep 2012 22:36:20 +0200
X-Google-Sender-Auth: z5idw8MznP9LAHuiaPXfqtAQtbA
Message-ID: <CA+2YH7vzOwfqcfhM1xu8W=LmD-UV58zLQ6=XvokrCTh1AUvMnA@mail.gmail.com>
From: Enrico <ebutera@users.berlios.de>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: RFC: 2 possible workarounds for recipes-misc dependency on Angstrom
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
X-List-Received-Date: Mon, 17 Sep 2012 20:36:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 14, 2012 at 10:06 PM, Maupin, Chase <chase.maupin@ti.com> wrote=
:
> So really I think the question is do we have an agreement on "meta-beagle=
" or whatever it should be called, a timeline for it to be created and the =
recipes moved?  Let's make meta-ti be the foundation BSP that we can all bu=
ild on top of and nothing more or less.

Sorry to jump into the discussion but...am i the only one that thinks
that having meta-beagle, meta-panda, meta-whateverTIboard is crazy?

Enrico

