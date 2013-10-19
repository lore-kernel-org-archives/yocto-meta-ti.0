Return-Path: <rstreif@linuxfoundation.org>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 80A3CE0169F
	for <meta-ti@yoctoproject.org>; Fri, 18 Oct 2013 18:09:24 -0700 (PDT)
Received: by mail-pd0-f172.google.com with SMTP id z10so5579384pdj.3
	for <meta-ti@yoctoproject.org>; Fri, 18 Oct 2013 18:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=99wNbOzhBNmBUx/fc8cbqu53j9iWNPAerfEUFeuQQms=;
	b=f3f5ql/pN3KfG3ihZUreU1uxogIwAHpYwtYNMN9QN58JuFkn7L3IUjJwL1iet2NY3f
	85/0hZ4wPU2SpYj4uRHUoKr5s6dZvR5Gp0Uq3ZvZ0tclbokQ7VVnA0PylyVupSl0o7zU
	gRub7yzWp2YUuOJQYSZVLAfFZOisD4LVcTh54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=99wNbOzhBNmBUx/fc8cbqu53j9iWNPAerfEUFeuQQms=;
	b=juC9O/6OwgOm4NfCJTqcbV+tSUQz09QkFvQVI4o8JK94gihDg3722o3yddMJf7qzop
	wE68Fy781u6nbuCt72j1GBW7dma+cqTSwjp4EQDguWVT/sSAoq3ocTZ1NYoOagfgJPvG
	Rb6FYsvnvHcB0+XmJ1+p+S1BriFjJQ27XcALWHgD3/b9B4moDttvuJC4TSosBPz82rGI
	xaVo2qthDJ3Xfw4iRv4he0UejI4VQN4VDQ49LiRm6wFg5rYqemGG+ikOjpeezlwSMVP1
	z6+rDLe+5FWgmU8qbdgOVcSL8IpA1oaOFQ4uZYc8NTpduP04Oat6nFS/GIkljFKTAsGk
	hFpA==
X-Gm-Message-State: ALoCoQlu++9Nhut2GXrKT0Jb1zTuJBUQnUCeDDCSsyni7S8wa4iHcn6rgbuUel9h7bfsSfaT390t
MIME-Version: 1.0
X-Received: by 10.66.150.69 with SMTP id ug5mr6203829pab.55.1382144963755;
	Fri, 18 Oct 2013 18:09:23 -0700 (PDT)
Received: by 10.69.25.101 with HTTP; Fri, 18 Oct 2013 18:09:23 -0700 (PDT)
In-Reply-To: <20131017214528.GC30989@edge>
References: <CA+gsK-p49VYtzviOwgtzssxxXnAS4Eku0Y95bsFL5LvT+v=9Sw@mail.gmail.com>
	<20131017214528.GC30989@edge>
Date: Fri, 18 Oct 2013 18:09:23 -0700
Message-ID: <CA+gsK-qKLdXTq1PJEmXLp0d5n5wEYf+6Na+pFj+UwnWLO_dt2g@mail.gmail.com>
From: Rudolf Streif <rstreif@linuxfoundation.org>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: AM335x EVM and core-image-sato
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
X-List-Received-Date: Sat, 19 Oct 2013 01:09:24 -0000
Content-Type: multipart/alternative; boundary=047d7b6dc31e97db8f04e90db3e1

--047d7b6dc31e97db8f04e90db3e1
Content-Type: text/plain; charset=ISO-8859-1

Well, I rebuilt with a newer version of meta-ti
(master, b3df09902da0d2469a02e9975d404e26c4c5ec0e). Now the /dev/fb0 device
is in the root file system. However:

   - Kernel image is now zImage but u-boot environment still looks for
   uImage; work around that and then
   - kernel panic - not syncing: Attempting to kill init! exitcode=0x0b.

One step forward, two steps back. Pulled again, and this time build fails
because branch ti-linux-312.y is not available.

What branch of meta-ti and what commit is working?

Thanks,
:rjs

--047d7b6dc31e97db8f04e90db3e1
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Well, I rebuilt with a newer version of meta-ti (master,=
=A0b3df09902da0d2469a02e9975d404e26c4c5ec0e). Now the /dev/fb0 device is in=
 the root file system. However:<div><ul><li>Kernel image is now zImage but =
u-boot environment still looks for uImage; work around that and then</li>
<li>kernel panic - not syncing: Attempting to kill init! exitcode=3D0x0b.</=
li></ul>One step forward, two steps back. Pulled again, and this time build=
 fails because branch ti-linux-312.y is not available.</div><div><br></div>
<div>What branch of meta-ti and what commit is working?</div><div><br></div=
><div>Thanks,</div><div>:rjs<br><div><br></div></div></div>

--047d7b6dc31e97db8f04e90db3e1--
