Return-Path: <cliff.brake@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BD88EE002AB
	for <meta-ti@yoctoproject.org>; Thu, 16 Aug 2012 15:12:00 -0700 (PDT)
Received: by lboi15 with SMTP id i15so2043807lbo.35
	for <meta-ti@yoctoproject.org>; Thu, 16 Aug 2012 15:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=Sn4QIvIhPuRiuhY+3TprnXAEjq+Ke4cl6fekm0KwpI0=;
	b=Vo9DVVkFFtC0cP4lVr3JIw2n4wBhagVLH+YUuUYEQ9QybIZBGLa6sJaJy4srM44K3W
	3tP5WWVTtoowJigovbIhlW1B6u+7i9ISnKqnhCPuPZCzONlN59FwK+9wDlGew1FHjfVF
	LMMLj6ym402W5hM6HWfX4s5CBJW60mYEzcbdsCw+Bs5mLjoNTzZnLy8W/MMyAD3ihazN
	iGt4SLytZy3w5VhswEx4LdgDIrxcbkCmc19Wzst3Max9HlRrJmO7KpcUGcnq0BiGLaD5
	KhIXcIczIj5qeDIZRgUiQRIWhQQsXtVoHua9ezYb3gKZed+zv/DKEzH6q3rocgyZGPhA
	4f+w==
MIME-Version: 1.0
Received: by 10.152.144.134 with SMTP id sm6mr2797406lab.5.1345155119234; Thu,
	16 Aug 2012 15:11:59 -0700 (PDT)
Received: by 10.112.85.196 with HTTP; Thu, 16 Aug 2012 15:11:59 -0700 (PDT)
Date: Thu, 16 Aug 2012 18:11:59 -0400
Message-ID: <CAOd_LFyjs=9C3Y2rO8R1A7GX0JO_iS+Vq7=k5m2FLFF7jdgivQ@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: meta-ti@yoctoproject.org
Subject: io CPU usage high
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Aug 2012 22:12:01 -0000
Content-Type: multipart/alternative; boundary=e89a8f2345170cbf9504c769551c

--e89a8f2345170cbf9504c769551c
Content-Type: text/plain; charset=ISO-8859-1

I've noticed with recent Angstrom images running on OMAP class CPUs, it
seems the IO CPU usage is very high when running from SD cards.  When there
is a lot of disk activity, the system becomes fairly unresponsive, and CPU
io usage is usually pegged.  Is this expected?  I don't recall seeing this
with older kernels such as 2.6.39 which I'm using on an older project.

Thanks,
Cliff

-- 
=================
http://bec-systems.com

--e89a8f2345170cbf9504c769551c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I&#39;ve noticed with recent Angstrom images running on OMAP class CPUs, it=
 seems the IO CPU usage is very high when running from SD cards. =A0When th=
ere is a lot of disk activity, the system becomes fairly unresponsive, and =
CPU io usage is usually pegged. =A0Is this expected? =A0I don&#39;t recall =
seeing this with older kernels such as 2.6.39 which I&#39;m using on an old=
er project.<div>
<br></div><div>Thanks,</div><div>Cliff<br clear=3D"all"><div><br></div>-- <=
br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br><a href=3D"http:/=
/bec-systems.com" target=3D"_blank">http://bec-systems.com</a><br>
</div>

--e89a8f2345170cbf9504c769551c--
