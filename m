Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CBA04E003FA; Fri, 18 Jul 2014 08:53:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BD66CE00342
	for <meta-ti@yoctoproject.org>; Fri, 18 Jul 2014 08:52:58 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6IFqqa4021051;
	Fri, 18 Jul 2014 10:52:52 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6IFqqRE020366;
	Fri, 18 Jul 2014 10:52:52 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 18 Jul 2014 10:52:51 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6IFqpYw004641;
	Fri, 18 Jul 2014 10:52:52 -0500
Date: Fri, 18 Jul 2014 11:52:51 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Message-ID: <20140718155251.GH15788@edge>
References: <1405691195-32751-1-git-send-email-maciej.borzecki@open-rnd.pl>
MIME-Version: 1.0
In-Reply-To: <1405691195-32751-1-git-send-email-maciej.borzecki@open-rnd.pl>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org, Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: Re: [PATCH] wic: wks and source plugin for creating SD card images
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
X-List-Received-Date: Fri, 18 Jul 2014 15:53:03 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jul 18, 2014 at 03:46:35PM +0200, Maciej Borzecki wrote:
> Commit 2b524321a25c35c5f987b8331e41b49d3b2e2d2b removed bbclass for
> building SD card images in favor of using wic. This commit adds a mic
> source plugin that prepares a useable boot partition as part of wic's
> image creation process. The plugin defines a new source type -
> beaglebonebootimg, similarly to the existing bootimg-{efi,pcbios} in
> current poky tree.
> 
> An example *.wks for setting up the partitions is provided as well.
> Usage:
> 
>   wic create beaglebonesdimage -e core-image-minimal

Not bad! The code looks rather clean.

Is --ondisk in .wks being locked to a specific SD card device?

And in general - this can be extended and re-used for other platforms in 
meta-ti, not just BeagleBone.


> Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
> Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
> ---
>  scripts/lib/image/canned-wks/beaglebonesdimage.wks |   5 +
>  .../lib/mic/plugins/source/beaglebonebootimg.py    | 109 +++++++++++++++++++++
>  2 files changed, 114 insertions(+)
>  create mode 100644 scripts/lib/image/canned-wks/beaglebonesdimage.wks
>  create mode 100644 scripts/lib/mic/plugins/source/beaglebonebootimg.py
> 
> diff --git a/scripts/lib/image/canned-wks/beaglebonesdimage.wks b/scripts/lib/image/canned-wks/beaglebonesdimage.wks
> new file mode 100644
> index 0000000..efd302d
> --- /dev/null
> +++ b/scripts/lib/image/canned-wks/beaglebonesdimage.wks
> @@ -0,0 +1,5 @@
> +# short-description: Create SD card image for BeagleBone
> +# long-description: Creates a partitioned SD card image for use with BeagleBone
> +
> +part /boot --source beaglebonebootimg --ondisk mmcblk0 --fstype=vfat --label boot --active --align 1024 --size 10
> +part / --source rootfs --ondisk mmcblk0 --fstype=ext3 --label root --align 1024
> diff --git a/scripts/lib/mic/plugins/source/beaglebonebootimg.py b/scripts/lib/mic/plugins/source/beaglebonebootimg.py
> new file mode 100644
> index 0000000..969632b
> --- /dev/null
> +++ b/scripts/lib/mic/plugins/source/beaglebonebootimg.py
> @@ -0,0 +1,109 @@
> +# ex:ts=4:sw=4:sts=4:et
> +# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License version 2 as
> +# published by the Free Software Foundation.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License along
> +# with this program; if not, write to the Free Software Foundation, Inc.,
> +# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> +#
> +# DESCRIPTION
> +# This implements the 'beaglebonebootimg' source plugin class for 'wic'
> +#
> +# AUTHORS
> +# Maciej Borzecki <maciej.borzecki (at] open-rnd.pl>
> +#
> +
> +import os
> +import shutil
> +import re
> +import tempfile
> +
> +from mic import kickstart, chroot, msger
> +from mic.utils import misc, fs_related, errors, runner, cmdln
> +from mic.conf import configmgr
> +from mic.plugin import pluginmgr
> +from mic.utils.partitionedfs import PartitionedMount
> +import mic.imager.direct as direct
> +from mic.pluginbase import SourcePlugin
> +from mic.utils.oe.misc import *
> +from mic.imager.direct import DirectImageCreator
> +
> +class BootimgPcbiosPlugin(SourcePlugin):
> +    name = 'beaglebonebootimg'
> +
> +    @classmethod
> +    def do_install_disk(self, disk, disk_name, cr, workdir, oe_builddir,
> +                        bootimg_dir, kernel_dir, native_sysroot):
> +        """
> +        Called after all partitions have been prepared and assembled into a
> +        disk image. Do nothing.
> +        """
> +        pass
> +
> +    @classmethod
> +    def do_configure_partition(self, part, cr, cr_workdir, oe_builddir,
> +                               bootimg_dir, kernel_dir, native_sysroot):
> +        """
> +        Called before do_prepare_partition(). Possibly prepare
> +        configuration files of some sort.
> +
> +        """
> +        pass
> +
> +    @classmethod
> +    def do_prepare_partition(self, part, cr, cr_workdir, oe_builddir, bootimg_dir,
> +                             kernel_dir, rootfs_dir, native_sysroot):
> +        """
> +        Called to do the actual content population for a partition i.e. it
> +        'prepares' the partition to be incorporated into the image.
> +        In this case, does the following:
> +        - sets up a vfat partition
> +        - copies u-boot
> +        - copies MLO
> +        """
> +        hdddir = "%s/boot" % cr_workdir
> +        rm_cmd = "rm -rf %s" % cr_workdir
> +        exec_cmd(rm_cmd)
> +
> +        install_cmd = "install -d %s" % hdddir
> +        tmp = exec_cmd(install_cmd)
> +
> +        img_deploy_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
> +
> +        mlo_img = "MLO"
> +        mlo_src_path = os.path.join(img_deploy_dir, mlo_img)
> +
> +        uboot_img = "u-boot.img"
> +        uboot_src_path = os.path.join(img_deploy_dir, uboot_img)
> +
> +        for entry in [(mlo_src_path, "MLO"), (uboot_src_path, "u-boot.img")]:
> +            file_src, file_dst = entry
> +            print '-- install %s as %s' % (file_src, file_dst)
> +            install_cmd = "install -m 0644 %s %s" \
> +                          % (file_src, os.path.join(hdddir, file_dst))
> +            tmp = exec_cmd(install_cmd)
> +
> +        if part.get_size() == 0:
> +            msger.error('Boot partition may not be 0 in size')
> +
> +        du_cmd = "du -bks %s" % hdddir
> +        rc, out = exec_cmd(du_cmd)
> +        blocks = int(out.split()[0])
> +
> +        extra_blocks = part.get_extra_block_count(blocks)
> +        if extra_blocks == 0:
> +            msger.error('Not enough space in boot parition')
> +
> +        part.prepare_empty_partition(cr_workdir, oe_builddir, native_sysroot)
> +
> +        mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (part.source_file, hdddir)
> +        exec_native_cmd(mcopy_cmd, native_sysroot)
> +
> -- 
> 1.9.0
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

