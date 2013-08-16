Return-Path: <b.hutchman@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 17B4BE00406
	for <meta-ti@yoctoproject.org>; Fri, 16 Aug 2013 14:04:47 -0700 (PDT)
Received: by mail-ob0-f179.google.com with SMTP id fb19so2556719obc.38
	for <meta-ti@yoctoproject.org>; Fri, 16 Aug 2013 14:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=jngWJAChoedWeQUF3WXGsj0MxCLZvyS1NaY3vHuXLfA=;
	b=aX8QG4q+0ISjYLC6DO1x8uFvwaRer8uoJbMChy86XGLgrJVa7zdrZeOO1JBPEeMX+F
	xtwx4ZC27IbAPm0skYdKXgmyKus9W7xYUpFhXfQ3e6TYCXTgF5mO7leHDKPZWcVB4+vS
	ycyn08i0u1GEgW2MA/CTE5cQTBZlWr8/BKFtXHeNuxeQWo87pzXI7E2r/6P07nb60Xz7
	9IEvAiNfQXz5G8LrhQRpnqPfY8CZEwkHnYjj0SlbeKHJvR6yM5mGsZW9Jo4197/ENl2/
	Q/OtdXghKVN4CNV4pONiYsKAWgGspGB9xb7RjAXf4wb2Oef409uaaDC7QF83x0XI9deC
	J5XA==
MIME-Version: 1.0
X-Received: by 10.60.155.200 with SMTP id vy8mr1702726oeb.72.1376687087026;
	Fri, 16 Aug 2013 14:04:47 -0700 (PDT)
Received: by 10.60.142.41 with HTTP; Fri, 16 Aug 2013 14:04:46 -0700 (PDT)
In-Reply-To: <CAFZh4h_683cetV7QjyVgBcsJ9Seooy5wiE8R-fU9L+sqJanU4g@mail.gmail.com>
References: <CAFZh4h_683cetV7QjyVgBcsJ9Seooy5wiE8R-fU9L+sqJanU4g@mail.gmail.com>
Date: Fri, 16 Aug 2013 17:04:46 -0400
Message-ID: <CAFZh4h8nh+CkW-6cgdgjug_igtcLHLrnb8fWqsJWx6RmXxSgsw@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
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
X-List-Received-Date: Fri, 16 Aug 2013 21:04:48 -0000
Content-Type: multipart/alternative; boundary=047d7bf18758ca082804e416f0b1

--047d7bf18758ca082804e416f0b1
Content-Type: text/plain; charset=ISO-8859-1

... This is smelling like my problem now:
http://e2e.ti.com/support/dsp/davinci_digital_media_processors/f/716/p/252033/885847.aspx

--047d7bf18758ca082804e416f0b1
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">... This is smelling like my pr=
oblem now:</div><div class=3D"gmail_extra"><a href=3D"http://e2e.ti.com/sup=
port/dsp/davinci_digital_media_processors/f/716/p/252033/885847.aspx">http:=
//e2e.ti.com/support/dsp/davinci_digital_media_processors/f/716/p/252033/88=
5847.aspx</a><br>
</div></div>

--047d7bf18758ca082804e416f0b1--
