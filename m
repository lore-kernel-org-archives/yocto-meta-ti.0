Return-Path: <maniacbug@ymail.com>
Received: from nm25-vm4.bullet.mail.ne1.yahoo.com
	(nm25-vm4.bullet.mail.ne1.yahoo.com [98.138.91.185])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id BF8DFE01351
	for <meta-ti@yoctoproject.org>; Wed, 25 Jul 2012 21:15:27 -0700 (PDT)
Received: from [98.138.90.53] by nm25.bullet.mail.ne1.yahoo.com with NNFMP;
	26 Jul 2012 04:15:27 -0000
Received: from [98.138.87.9] by tm6.bullet.mail.ne1.yahoo.com with NNFMP;
	26 Jul 2012 04:15:27 -0000
Received: from [127.0.0.1] by omp1009.mail.ne1.yahoo.com with NNFMP;
	26 Jul 2012 04:15:27 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 61284.81299.bm@omp1009.mail.ne1.yahoo.com
Received: (qmail 51501 invoked by uid 60001); 26 Jul 2012 04:15:27 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ymail.com; s=s1024;
	t=1343276127; bh=S04AiOc4/+uRFm9FUiPZdVn+omAoC5YHtGfabMh9UZQ=;
	h=X-YMail-OSG:Received:X-Mailer:References:Message-ID:Date:From:Reply-To:Subject:To:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=UQw6CeEmsilK8+Y/hpiHzNYi1akCGEzshcqrk7Nt2Jg/GtL/SQ9MuOF7dUFQhJqd1St2+FRMLbvKbXZeiY5qUVwtZyinkk/H2dku4pbsWmX0YG+RMeiorBDp2Nzzr+4PkRPLaGalOL9/LBfbqUnYex3ih6RBH9x7M13Yl1YIu8E=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=ymail.com;
	h=X-YMail-OSG:Received:X-Mailer:References:Message-ID:Date:From:Reply-To:Subject:To:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=X92l9h90xkM/T0idnbK8qvCFQtlXlz4qQ7EXR3gvUjCnsLOQmG5wZHLL+tpy968PeV49SrIBYdPbUE6FNddbm5wug6P/e94biqIFzIOn0V1nBEmoYT6y1ruLjmX9L1IyEI7tqN0TETZJo8iTA5MsSjeZ/h58AfSP4wPBz4gNv6g=;
X-YMail-OSG: WXNunkAVM1n0mjW4LeoYiGdZuOZIOFmy04UbuCnyYk8BjZl
	l3r5h0XdIyEBZlXDJKyCOiU6Ziseb.OG9_bM7qjUQzt7CHgz0tjNnA0w5AT1
	64QFxATbQTT6gDVHRLDXQRppTFcv1v3g5tee4XfaftKHeN5hN.fWVI8kb07H
	sVgYgtrLDy.UjPn1nvTSCMLeIrGGeTXphpty8t8j3XUtLVU54kag1yJQC0.Z
	jlvf74W0awRQOAs3izHQb.OcYu5ufTIcH0oL_sixLoNmoU.sORpsNbYDDrE.
	xuBH40IT8u41cESR8hcfJW_Aw3Wu_ACys3lLGzmbdgoes.Gm_whd3eoWpjDa
	OSug3emEhosb6aaRbfVLLznALuTgYgPIlIfJqaNLmkqwZ1jSlavaoQZMqj7M
	wf85bCSEJW3jSiFEo3SSuQ1fUcS.Fzekjff_7CJV5tvhq2Sh_eZg8rb6C9F5
	v5wWj5_vYQ6BMkLSqWmSdzmmTTnu7vfqgH3z_YzN5EpJXpsdOvPKN2C7fLQM KlQ--
Received: from [50.135.220.100] by web121604.mail.ne1.yahoo.com via HTTP;
	Wed, 25 Jul 2012 21:15:26 PDT
X-Mailer: YahooMailWebService/0.8.120.356233
References: <mailman.4996.1343266334.2458.meta-ti@yoctoproject.org>
Message-ID: <1343276126.22559.YahooMailNeo@web121604.mail.ne1.yahoo.com>
Date: Wed, 25 Jul 2012 21:15:26 -0700 (PDT)
From: maniacbug <maniacbug@ymail.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
In-Reply-To: <mailman.4996.1343266334.2458.meta-ti@yoctoproject.org>
MIME-Version: 1.0
Subject: Re: omapfbplay depends on libav
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
X-List-Received-Date: Thu, 26 Jul 2012 04:15:28 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

> They do, it's called openembedded-core. =0A> It's exactly the same. Do no=
t confuse oe-core with meta-oe, however=0A=0AOk, yes it is a bit confusing.=
=A0 Thank you for helping clarify.=0A=0AIn fact, when I started building OE=
, asking for clarification of OE issues, the response from that list was, "=
Beginners should use Yocto."=A0 Indeed it's helpful that yocto/poky are cle=
anly organized and well-documented.=A0 OE seems to have many more subtle nu=
ances.=0A=0A> And I think you mean poky, not yocto.=0A=0AWell now, this app=
ears to have been debated at length.=A0 If 'poky' is preferred here, I'm ha=
ppy to use it.=A0 Do note, though, that /etc/issue proudly proclaims that I=
 am running "Yocto (built by poky)". And in order to download the denzil re=
lease from yoctoproject.org, one clicks on a link entitled, "Yocto Project"=
.=A0 So try not to be too hard on people who think they are running Yocto o=
n their hardware.=A0 The boundaries of Yocto and Poky are not clear and obv=
ious.=0A=0A> Ah,=0A your intimate knowledge of libav reveals itself! Libav =
has no specific =0AA9 optimizations, only NEON ones, so your insinuation is=
 not based on =0Aactual facts.=0A=0AYes, it's true.=A0 I'm hopeful to achie=
ve a running video player in this environment without intimate knowledge of=
 libav.=A0 To my view, that's the nice thing of Linux as opposed to running=
 bare metal: there's a wealth of software available.=A0 It should be possib=
le to assemble a working system without intimate knowledge of every compone=
nt.=0A=0APlus, every time we post to a list, we get a few more helpful nugg=
ets :)=0A=0Am.b=0A

