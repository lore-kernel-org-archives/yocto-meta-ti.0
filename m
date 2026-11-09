Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7771.1794235980694424180
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Nov 2026 06:53:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=kvh3Mxq9;
 spf=pass (domain: criticallink.com, ip: 209.85.128.171, mailfrom: jcormier@criticallink.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b10d24345dso8735687b3.3
        for <meta-ti@lists.yoctoproject.org>; Mon, 09 Nov 2026 06:53:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794235979; cv=none;
        d=google.com; s=arc-20260327;
        b=JoVuA33wSnLp7LXk71GD9sHPDPSeujrmYYDYuaV18jApdUIjJ0vmhmEQOhUJ9EMeuP
         8J+XTmCjSJSmqhbwbfmiGvxgQVtf9vTKoRZvUgBZLjxMlclCYa+A4i6gA3XQIKjJxp/q
         wmpCs54EIxs6GhFsLp5Bzbeons8dJ6smPQCwWbVpkSr5Ri3b+/nhNuIyFoS1xG9kVaUy
         pmTRMff+cNa/VLksyWbD1mW3SpzY1KkHWI5Dnf8c2UeoHkqe4+jSHJDe4Kph+MG3uGgT
         cmC+n9KYgwOKB2bU+Y/tm9SQwH3cXA7jK1h0INSRDKAW0F7B13XI3fB3BMmh6jNvI+K8
         2vag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9K9BGO9/L5buZrcTbD1+u8Y8070T03o0RKU/zVu3mBo=;
        fh=jfYtfGNumAiL/lL0Rt9MlVmSX5IIO7EA4LE48kj2NwM=;
        b=RdA8O9haUX8YsGuUay18Dx1iqQTOPH7xNoY7217yfiyxc90dim+hhrLvi7W8X3hecW
         k1OP75E9ubWAqp82WwuImUAUTr5A2VshPmo3HqVBSiIMe/7lQ/44mM95YW4834Pj2oPx
         Qq7Pmu14CbCA020qtRKVGLAkY/t7v9y8iiHvH0bLuBaKrnsnLEvEGPm1vqTOr2rcclfm
         hjQT2jsz8YjZBa9ieZPuACdFPHx+WzUrYNT/Rk7IzcAG8vbK2HJuhS1xuKPMuPbST2LJ
         sN0v8JxDcD4bKgeYWuQebMLgO0S0dnLJbNoKbzz56mMyY977RdaTwo2rtfjiv9UiaYSp
         prWw==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1794235979; x=1794840779; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9K9BGO9/L5buZrcTbD1+u8Y8070T03o0RKU/zVu3mBo=;
        b=kvh3Mxq99qYQmyCg+nmN7ubmDV48Eq/J/ulCiVx6ljKKf2xxNPjVGGyWuQyGDcnQxg
         uqobtVOSbYlCGUWNanbHNbpLYKWcPPc//CRACAY0eSlZWhiURqg+MQw5ktTGP+E49dn2
         lrD0Xu5Rro5FoanDs3L2O/X7ZH8mJxesihwbfiGPCN1a0exkk0CQ00ER7NGy5MNoaUqO
         c4NTYMCSgV9gZTfEpf+nYnT80APe/hclFJkvzfrILIEiluKD3EByRtKGT2jjhAYNwUjZ
         Q9eyp2vZVmdyoUjIC7VGQ9KOyBCQ23lH2jqBQRnj+g12DLROfIqrgT9YHr5cH9eEfpj8
         ZPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794235979; x=1794840779;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9K9BGO9/L5buZrcTbD1+u8Y8070T03o0RKU/zVu3mBo=;
        b=garmQepncmtNUoyeJETwSH7W+CkLVkM7LGtab9lER5AkOWZMcvlBdgHizoBSaG5RRX
         90dbU4HgDrHXDWEW89x7XAVSHMqX1Gt4eGDF4EYn9kklDdIYCWGlDANVfmpvJcvhTNE3
         PQpaSfe2mTpTfQZ+VG1fpBfToS5IpXriHJ+YFthUyF7magndx+6ipK05fqqRE09LxHkr
         NZa6q16FWvFYOF1QSDggJ5AdzoHU9mtX03XS6kTf7A6pYRdax6WgLAjE9o8IaBjeWEZ3
         o1ThS0izKPbMuLgs+Q6ma7fhBIoYRURmzORtrN97mho4QtiGF3lIcB02+623OYZzMOdx
         //GQ==
X-Forwarded-Encrypted: i=1; AL+hErEP0lELQv8dbzsUlGJOVy26eax3U76kU4ZkrYbDflk+x4l5OEPbphNiyfKqu/y4kJs1knP85TCm@lists.yoctoproject.org
X-Gm-Message-State: APuU4Z8LJAyjDxIXWUoSUstM+7TywLGQfCTsrNg17WbrpPEKIAd51YYn
	hMuOgp9nfuMdw+fN3Znexvevv8hMv7eJAuFP17rL6LoyzpW0wZ7CJIu9Ru9GoCW79Axk6ynSIPf
	JXxeYaWdKCe9pRaQFDTyCEDRm9BUDfx0WMXxV1yEp
X-Gm-Gg: AYBFou1WXAsbLWck7DLD7Y0+NSPvI4tBmyUktVfAHegjVPXfhJXxbguJLoug6+Qiz7t
	P+WzVqd0DyJcFLNgjRm1chDlZPSkgslcIFGNOtw2cGJoKBjl7sIHmGpyvgaiuCR5pkNKZt0B5N6
	UP9C4yW2RK6fpHQvKHcPhHkFeddevVLzixKr9z47IrP1tKv7umJZaBG+faruatYmaxvZOoq42uf
	QSTAJezUUj6S/y2NN7ypSnVBn6J3S9hUYZMr23dc6GQ9dNIl2t0OgI6ZpPtSzkfMTx+6/cgxj/T
	KLQCCbCLKWKy+eJoZFgOzYslEyn9/KN2tJtyXmcAh5GGj5mxJz6/OLh4J1SXcL+LeeQy/6ZlyTx
	LaZ/9fQ4ttWnwXYOhTRPdA2TrNq0C3K3aw30=
X-Received: by 2002:a05:690e:168f:b0:67c:1dca:7e0 with SMTP id
 956f58d0204a3-67c3d7e2de1mr2739972d50.14.1794235979072; Mon, 09 Nov 2026
 06:52:59 -0800 (PST)
MIME-Version: 1.0
References: <CAFMvBt0wRnyFses6F3WNhSmxzNP-GvTi5tY3DgKCbVRTfMVcDA@mail.gmail.com>
 <20261105162117.GA4190@denix.org> <CAFMvBt1XU-uvKWzMN3o48BeqHZmUEGaXQNkquRzn=+GMa9PbEQ@mail.gmail.com>
 <18E6673C76794CD6.681194@lists.yoctoproject.org>
In-Reply-To: <18E6673C76794CD6.681194@lists.yoctoproject.org>
From: Jon Cormier <jcormier@criticallink.com>
Date: Mon, 9 Nov 2026 09:52:47 -0500
X-Gm-Features: AclHuK8yzL9AzTnhl8pqxFOg4pDksgBXGwxLc6pWEEWHZrR-z2Aw9gXhcRVm3TU
Message-ID: <CADL8D3bYUZqxQ50X=MPQMm2T-iB_Xo=DCamc82H8a=dNWegARw@mail.gmail.com>
Subject: Re: [meta-ti] Unable to clone or fetch from git.ti.com
To: jcormier@criticallink.com
Cc: troth@openavr.org, Denys Dmytriyenko <denis@denix.org>, meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Mon, 09 Nov 2026 14:53:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20514

Single branch clones also seem to work...

$ git clone https://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git
--single-branch
Cloning into 'ti-linux-kernel'...
remote: Enumerating objects: 11986196, done.
remote: Counting objects: 100% (11986196/11986196), done.


On Mon, Nov 9, 2026 at 9:36=E2=80=AFAM Jon Cormier via meta-ti
<jcormier=3Dcriticallink.com@lists.yoctoproject.org> wrote:
>
> On Mon, Nov 9, 2026 at 9:00=E2=80=AFAM Theodore A. Roth via meta-ti
> <troth=3Dopenavr.org@lists.yoctoproject.org> wrote:
> >
> > Thanks for the response Denys!
> >
> > On Thu, Nov 5, 2026 at 9:21=E2=80=AFAM Denys Dmytriyenko <denis@denix.o=
rg> wrote:
> > >
> > > Yes, git.ti.com is periodically under heavy AI bot crawlers attack an=
d
> > > sometimes goes down.
> > >
> > > But meta-ti-bsp already sets up MIRRORS to point to github, where TI =
core
> > > repos, like kernel and u-boot, are mirrored. This works for most user=
s
> > > automatically and doesn't break.
> > >
> > > The error you are seeing is because you heve your own PREMIRRORS (e.g=
. using
> > > own-mirrors.bbclass), which contains an older clones of those repos a=
nd hence
> > > bitbake tries to use those, instead of falling back to MIRRORS, and c=
an't find
> > > the required SRCREV:
> > >
> > > | Error: UnpackError('No up to date source found: clone directory not=
 available or not up to date:
> > > | /home/troth/Yocto/Downloads/git2/git.ti.com.git.ti-linux-kernel.ti-=
linux-kernel.git
> >
> > I'm not using PREMIRRORS in this setup. That clone directory is in my
> > DL_DIR which I share
> > across multiple builds.
> >
> > I have found that the MIRRORS setup by meta-ti-bsp do not get used
> > until I manually
> > removed the primary git repo from my DL_DIR. Only then did bitbake
> > fetch from the
> > github mirror and created the following symlink:
> >
> >     git.ti.com.git.ti-linux-kernel.ti-linux-kernel.git ->
> > ${DL_DIR}/git2/github.com.TexasInstruments.ti-linux-kernel.git/
> >
> > Doubt that this is a meta-ti issue though. Bug in bitbake? Don't know,
> > have not dug into it yet.
> >
> > >
> > >
> > > You can disable your PREMIRRORS temporarily and re-fetch affected com=
ponents,
> > > then you can re-enable it back.
> >
> > I agree in theory, but I'm finding it impossible to sync up my local
> > DL_DIR cache because
> > all fetches from https://git.ti.com/git/*/*.git fail for me
> >
> > I was able to clone ti-u-boot using
> > 'https://git.ti.com/cgit/ti-u-boot/ti-u-boot', but that did not
> > work for the kernel:
> >
> >     $ git clone https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel
> >     Cloning into 'ti-linux-kernel'...
> >     fatal: unable to access
> > 'https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/': The
> > requested URL returned error: 403
> >
> > >
> > > Please note that there are a few other TI repos, mostly used in meta-=
ti-extras
> > > and meta-ti-tests, which are not mirrored on github, but they haven't=
 been
> > > updated in a while, so your existing copies from your PREMIRRORS shou=
ld be
> > > fine.
> >
> > I'm seeing the same issues when bitbaking with the following repos
> > from meta-ti-bsp
> > (which do not have github mirrors; note that this is after I manually
> > updated u-boot and kernel):
> >
> > Summary: 6 tasks failed:
> >   $MYBUILDDIR/build-hs-prod/../oe/meta-ti/meta-ti-bsp/recipes-bsp/pruhs=
r-fw/pruhsr-fw_2.17.25.bb:do_unpack
> >     log: $MYBUILDDIR/build-hs-prod/tmp/work/armv7at2hf-neon-trimble-lin=
ux-gnueabi/pruhsr-fw/2022.01/temp/log.do_unpack.1887083
> >   $MYBUILDDIR/build-hs-prod/../oe/meta-ti/meta-ti-bsp/recipes-bsp/goodi=
x-fw/goodix-fw_git.bb:do_unpack
> >     log: $MYBUILDDIR/build-hs-prod/tmp/work/armv7at2hf-neon-trimble-lin=
ux-gnueabi/goodix-fw/1.0.0.0/temp/log.do_unpack.1887084
> >   $MYBUILDDIR/build-hs-prod/../oe/meta-ti/meta-ti-bsp/recipes-bsp/pruet=
h-fw/prueth-fw_5.6.15.bb:do_unpack
> >     log: $MYBUILDDIR/build-hs-prod/tmp/work/armv7at2hf-neon-trimble-lin=
ux-gnueabi/prueth-fw/2022.01/temp/log.do_unpack.1887085
> >   $MYBUILDDIR/build-hs-prod/../oe/meta-ti/meta-ti-bsp/recipes-bsp/prupr=
p-fw/pruprp-fw_2.17.25.bb:do_unpack
> >     log: $MYBUILDDIR/build-hs-prod/tmp/work/armv7at2hf-neon-trimble-lin=
ux-gnueabi/pruprp-fw/2022.01/temp/log.do_unpack.1887086
> >   $MYBUILDDIR/build-hs-prod/../oe/meta-ti/meta-ti-bsp/recipes-bsp/prusw=
-fw/prusw-fw_3.2.9.bb:do_unpack
> >     log: $MYBUILDDIR/build-hs-prod/tmp/work/armv7at2hf-neon-trimble-lin=
ux-gnueabi/prusw-fw/2022.01/temp/log.do_unpack.1887087
> >   $MYBUILDDIR/build-hs-prod/../oe/meta-ti/meta-ti-bsp/recipes-bsp/ti-rt=
os-fw/ti-rtos-messageq-test-fw_git.bb:do_unpack
> >     log: $MYBUILDDIR/build-hs-prod/tmp/work/armv7at2hf-neon-trimble-lin=
ux-gnueabi/ti-rtos-messageq-test-fw/3.52.00.01/temp/log.do_unpack.1887124
> > Summary: There were 6 ERROR messages, returning a non-zero exit code.
> >
> > Unfortunately, git.ti.com is unusable for me right now (and it sounds
> > like it is for others too).
> >
> > Is this really an overloaded server (due to AI crawlers) or some
> > problem on the server?
> I agree, from my poking around it seems like they've changed  QOS
> settings or similar to try and block the bots and have accidentally
> broken git clones.
>
>   - Listing branches works. git ls-remote returns all 2164 refs.
>   - Full clone fails: error: RPC failed; HTTP 501 curl 22 / fatal:
> expected 'packfile'.
>   - Shallow clone works: --depth 1 -b master completes with both
> protocol v0 and v2.
>   - Compression seems to trip it up. Sending smal request with curl
> with Content-Encoding: gzip gets 501. Uncompressed requests get 200,
> even with 2000 wants (93 KB), and so do requests sent in chunks.
>
> The full clone pulls a lot more data and git seems to auto gzip its
> requests when they are over a certain size.
>
>
> Via AI wizardry, Apparently you can limit the size of git requests,
> which does let the clone complete, albeit slowly. Don't go below 65520
> as that crashes git (BUG: remote-curl.c:1531)....
>
> git -c http.postBuffer=3D65537 clone
> https://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git
>
> Note I really don't think this is a reasonable workaround, and I don't
> understand why they would block gzip so either its unintentional or
> the diagnosis is wrong. Adding this to a yocto config would presumably
> disable gzip compression on all git fetches so not great.
> >
> > FYI: I'm trying to update our OS builds to the latest HEAD of wrynose,
> > so I'm keen to
> > find some solution that doesn't require manually tweaking things for
> > every developer
> > and our CI system.
> Same
> >
> > Thanks.
> >
> > Ted Roth
> >
> >
> >
>
>
> --
> Jonathan Cormier
> Senior Software Engineer
>
> Office:  315.425.4045 x222
>
> http://www.CriticalLink.com
> 6712 Brooklawn Parkway, Syracuse, NY 13211
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#20513): https://lists.yoctoproject.org/g/meta-ti/mess=
age/20513
> Mute This Topic: https://lists.yoctoproject.org/mt/122110829/7902621
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [jcormier@cri=
ticallink.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Jonathan Cormier
Senior Software Engineer

Office:  315.425.4045 x222

http://www.CriticalLink.com
6712 Brooklawn Parkway, Syracuse, NY 13211
