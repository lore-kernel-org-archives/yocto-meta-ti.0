Return-Path: <maniacbug@ymail.com>
Received: from nm6-vm2.bullet.mail.ne1.yahoo.com
	(nm6-vm2.bullet.mail.ne1.yahoo.com [98.138.90.154])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 0AECEE0027D
	for <meta-ti@yoctoproject.org>; Mon, 30 Jul 2012 13:50:21 -0700 (PDT)
Received: from [98.138.90.56] by nm6.bullet.mail.ne1.yahoo.com with NNFMP;
	30 Jul 2012 20:50:20 -0000
Received: from [98.138.89.173] by tm9.bullet.mail.ne1.yahoo.com with NNFMP;
	30 Jul 2012 20:50:20 -0000
Received: from [127.0.0.1] by omp1029.mail.ne1.yahoo.com with NNFMP;
	30 Jul 2012 20:50:20 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 581712.44614.bm@omp1029.mail.ne1.yahoo.com
Received: (qmail 13277 invoked by uid 60001); 30 Jul 2012 20:50:20 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ymail.com; s=s1024;
	t=1343681420; bh=60ciTmOvDUOKN1BLGtiUBoZpFO85eK3En2W3XRw+8M4=;
	h=X-YMail-OSG:Received:X-Mailer:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=johSia+sSRd6Z83WtB23sbHjB+G39n6NNVbL/iqjMJGxWevCE/fdj89MKJ4hI/HdFiJQwYL/uk2GKIzQUdKTCd2vYdskuzywWbW8E+ded/Oq/KlejvTn9Q9/ygc0wRDPNqDA0UMk6/lU3C+O0NHgT+6rftzm0yQe1ruLLCT7QDE=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=ymail.com;
	h=X-YMail-OSG:Received:X-Mailer:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=Uc9N1msyHh4VOqi/rRp93mJKyc7+Fb1t0Tyd0gycxVKcUuLicnblQa1ntPIGgsCr7VZEI6SxCPQUU6p4shp4T/kxFtXlm8Soa1Z1wd2N88PsGwOfaCoJu0vPksGqO6fKdsmdb12lQ/d2RUGG7vP6pEhVTgTWVGZ8SpyyiUPEpEg=;
X-YMail-OSG: s.4R51gVM1mu_K20PXbk13TeDCqOks1B8H0QFdYkTxrL1vf
	moGFfc28byJq6DpD6A9tEVuNi2.kVRAZKJulLq.tvPbtrtnZLo6XHRe2ZEn4
	L1C_EWrUbbv.Y.rFp.ueNL1m39sQqoguo2fJyWUwyeBeg_WoYxtdhAm61x0W
	XlIkwrJiPcCseYUK.bOu61w2dOwncwwxImcADMKvDbLjGtAh7T9JfW.AkHfw
	QN02_hYO5zsXZVRDcD5MBhTRMto2P5oSuzt8igpmN57NoOfLJqAlw.Djg37y
	0nVtJTK9BxO.xWh4LuLzgm_P.4IAgwrw9Jz5aJ.gRBfsLTrvDA0TX0Y4y1e8
	F0IARcSERUmp_UpsxF0hv0mtJFYAfayo2ndcVQfJlRrgKMyKZXxiHQTW5CBm
	ib1Hn_sfOBMsENVr9OHrupmShiWlrU3E-
Received: from [50.135.220.100] by web121606.mail.ne1.yahoo.com via HTTP;
	Mon, 30 Jul 2012 13:50:20 PDT
X-Mailer: YahooMailWebService/0.8.120.356233
Message-ID: <1343681420.8942.YahooMailNeo@web121606.mail.ne1.yahoo.com>
Date: Mon, 30 Jul 2012 13:50:20 -0700 (PDT)
From: maniacbug <maniacbug@ymail.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
MIME-Version: 1.0
Subject: Sound on Pandaboard?
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: maniacbug <maniacbug@ymail.com>
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Jul 2012 20:50:22 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Hi. As mentioned before, I'm running "Yocto (Built by Poky 7.0) 1.2" on Pan=
daboard with meta-ti. Thanks for the previous help on video, "ffplay" from =
libav (ported from openembedded) is playing video only now (not audio).=0A=
=0A=0AAs a simple test, I'm now trying to play an MP3 file with gaku (the S=
ato music player). This results in 3 lines of the following per attempt:=0A=
=0AJul 25 13:48:23 pandaboard user.warn kernel: [ 30.949951] SDP4430 Media:=
 asoc: SDP4430 Media no valid playback route from source to sink=0A=0Aaplay=
 gives the same result, and adds:=0A=0AALSA lib pcm_dmix.c:1018:(snd_pcm_dm=
ix_open) unable to open slave=0Aaplay: main:682: audio open error: Invalid =
argument=0A=0AIs there anything particular I should be setting up in meta-t=
i to enable audio?=A0 (Or should this question be posed on the yocto list i=
nstead?)=0A=0AThanks,=0A=0Am.b

